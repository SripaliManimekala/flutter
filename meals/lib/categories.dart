import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {

  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      //output all categories => which can be selected and move inside to:
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio:1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Text('Category1', style: TextStyle(color: Colors.white),),
          Text('Category2', style: TextStyle(color: Colors.white),),
          Text('Category3', style: TextStyle(color: Colors.white),),
          Text('Category4', style: TextStyle(color: Colors.white),),
          Text('Category5', style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}