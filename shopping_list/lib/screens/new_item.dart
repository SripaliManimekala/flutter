import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  State<NewItemScreen> createState() {
    return _NewItemScreenState();
  }
}

class _NewItemScreenState extends State<NewItemScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedcategory = categories[Categories.vegetables]!;

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
       _formKey.currentState!.save();
      //pass data to another screen
      Navigator.of(context).pop(GroceryItem(
        id: DateTime.now().toString(), 
        name: _enteredName, 
        quantity: _enteredQuantity, 
        category: _selectedcategory));

    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                validator: (value) {
                  //can return error if validation fails
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Quantity"),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: _enteredQuantity.toString(),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be a valid positive number.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedcategory,
                      items: [
                      for (final category in categories.entries)
                        DropdownMenuItem(
                          value: category.value,
                          child: Row(
                            children: [
                              ColoredBox(
                                color: category.value.color,
                                child: const SizedBox(
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(category.value.title)
                            ],
                          ),
                        )
                    ], 
                    onChanged: (value) {
                      setState(() {
                        _selectedcategory = value!;
                      });
                    }),
                  )
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: const Text('Reset')),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: _saveItem, child: const Text('Add Item'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
