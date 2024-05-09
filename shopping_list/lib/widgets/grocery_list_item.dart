import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class GroceryListItem extends StatelessWidget {
  const GroceryListItem({super.key, required this.groceryItem, required this.onRemoveItem});

  final void Function(GroceryItem item) onRemoveItem;
  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),

      child: Dismissible(
        key: ValueKey(groceryItem.id),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [groceryItem.category.color.withAlpha(100),groceryItem.category.color.withAlpha(150)] )
          ),
          margin:const EdgeInsets.symmetric(
            horizontal: 5,
          ),
        ),
        onDismissed: (direction) {
          onRemoveItem(groceryItem);
        },
        child: Row(
          //can use a list tile here
          children: [
            ColoredBox(
              color: groceryItem.category.color,
              child: const SizedBox(
                width: 20,
                height: 20,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(groceryItem.name),
            const Spacer(),
            Text(groceryItem.quantity.toString()),
          ],
        ),
      ),
    );
  }
}
