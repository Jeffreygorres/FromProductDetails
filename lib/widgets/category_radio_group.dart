import 'package:flutter/material.dart';

class CategoryRadioGroup extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onChanged;

  const CategoryRadioGroup({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const categories = ["Electronics", "Furniture", "Clothing"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Category", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ...categories.map((cat) => RadioListTile<String>(
          title: Text(cat),
          value: cat,
          groupValue: selectedCategory,
          onChanged: (val) => onChanged(val!),
        )),
      ],
    );
  }
}
