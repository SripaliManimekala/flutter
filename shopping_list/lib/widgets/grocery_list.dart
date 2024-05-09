import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/grocery_list_item.dart';


class GroceryList extends StatelessWidget {

  const GroceryList({super.key, required this.groceryItems, required this.onRemoveItem});

  final void Function(GroceryItem item) onRemoveItem;
  final List<GroceryItem> groceryItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: groceryItems.length,
      itemBuilder: (ctx, index) => GroceryListItem(
        groceryItem: groceryItems[index],
        onRemoveItem: onRemoveItem,
        ),
    );
  }
}