import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/screens/new_item.dart';
import 'package:shopping_list/widgets/grocery_list.dart';
import 'package:http/http.dart' as http;

class GroceriesScreen extends StatefulWidget {
  const GroceriesScreen({super.key});

  @override
  State<GroceriesScreen> createState() => _GroceriesScreenState();
}

class _GroceriesScreenState extends State<GroceriesScreen> {
  List<GroceryItem> _groceryItems = [];
  // var _isLoading = true;
  late Future<List<GroceryItem>>
      _loadedItems; //late - tell swe have no initial value but will have a value in future
  String? _error;

  //call load items in init
  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  //load items in app load up
  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
        'flutter-prep-22dd0-default-rtdb.firebaseio.com', 'shopping-list.json');

    final response = await http.get(url);

    if (response.statusCode >= 400) {
      // setState(() {
      //   _error = 'Failed to fetch data. Please try again later.';
      // });
      throw Exception('Failed to fetch data. Please try again later.');
    }

    if (response.body == 'null') {
      // setState(() {
      //   _isLoading = false;
      // });
      return []; //return empty list since load items is a list
    }

    //convert JSON data back to dart objects
    final Map<String, dynamic> listData = json.decode(response.body);
    //convert back to list og DroceryItems
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      //first tem that matches the condition
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      loadedItems.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category));
    }
    // setState(() {
    //   _groceryItems = lodedItems;
    //   _isLoading = false;
    // });
    return loadedItems;
  }

  void _addItem() async {
    //get new item without fetching it from backend
    final newItem = await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItemScreen()));

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final groceryIndex = _groceryItems.indexOf(item);

    //delete from local list without fetching again
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https('flutter-prep-22dd0-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');

    //delete from database
    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      if (!context.mounted) {
        return;
      }

      ScaffoldMessenger.of(context)
          .clearSnackBars(); //clear any previous snackbars when swipe
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Failed to delete item.'),
      ));
      //save again locally
      setState(() {
        _groceryItems.insert(groceryIndex, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
        body: FutureBuilder(
          future: _loadedItems,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              //isLoading
              content = const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (snapshot.data!.isEmpty) {
              return Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'nothing here!',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Try adding category!',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ],
              ));
            }
  
            GroceryList(
              groceryItems: _groceryItems,
              onRemoveItem: (item) {
                _removeItem(item);
              },
            );
          },
        ));
  }
}
