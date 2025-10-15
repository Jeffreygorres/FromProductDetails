import 'package:flutter/material.dart';

void showResultDialog(BuildContext context, String title, Map<String, dynamic> data) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.entries
            .map((e) => Text("${e.key}: ${e.value}", style: const TextStyle(fontSize: 16)))
            .toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    ),
  );
}
