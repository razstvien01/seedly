import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final String text;
  // final ValueChanged<String> onChanged;
  final String hintText;
  final controller = TextEditingController();
  
  SearchWidget({
    Key? key, 
    required this.text,
    // required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        // height: 42,
        // margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey,
          border: Border.all(color: Colors.black26),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            icon: Icon(Icons.search)
          ),
        ),
      ),
    );
  }
}