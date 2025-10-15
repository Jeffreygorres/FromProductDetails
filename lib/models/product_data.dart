import 'package:flutter/material.dart';

class ProductData {
  final String name;
  final String serial;
  final double price;
  final String category;

  ProductData(this.name, this.serial, this.price, this.category);

  factory ProductData.fromControllers(TextEditingController name, TextEditingController serial,
      TextEditingController price, String category) {
    return ProductData(name.text, serial.text, double.parse(price.text), category);
  }

  Map<String, dynamic> toMap() => {
    "Product Name": name,
    "Serial Number": serial,
    "Price": price.toStringAsFixed(2),
    "Category": category,
  };
}
