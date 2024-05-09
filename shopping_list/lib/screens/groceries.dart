import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/screens/new_item.dart';
import 'package:shopping_list/widgets/grocery_list.dart';

class GroceriesScreen extends StatefulWidget {
  const GroceriesScreen({super.key});

  @override
  State<GroceriesScreen> createState() => _GroceriesScreenState();
}

class _GroceriesScreenState extends State<GroceriesScreen> {

  final List<GroceryItem> _groceryItems = [];

  void _addItem() async{
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (ctx) => const NewItemScreen()));
    
    if(newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    final groceryIndex = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });
        ScaffoldMessenger.of(context)
        .clearSnackBars(); //clear any previous snackbars when swipe
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Item deleted.'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _groceryItems.insert(groceryIndex, item);
            });
          }),
    ));
  }


  @override
  Widget build(BuildContext context) {

    Widget content = GroceryList(
      groceryItems: _groceryItems, 
      onRemoveItem: (item) {
        _removeItem(item);
      } ,);

    if(_groceryItems.isEmpty) {
      content = Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'nothing here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try adding category!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content
    );
  }
}