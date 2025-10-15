import 'package:flutter/material.dart';
import '../widgets/form_fields.dart';
import '../widgets/result_dialog.dart';
import '../widgets/category_radio_group.dart';
import '../models/product_data.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({super.key});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final serialController = TextEditingController();
  final priceController = TextEditingController();
  String category = "Electronics";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Registration")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                label: "Product Name",
                controller: nameController,
                validator: (v) => v!.isEmpty ? "Enter product name" : null,
              ),
              CustomTextFormField(
                label: "Serial Number",
                controller: serialController,
                validator: (v) => v!.isEmpty ? "Enter serial number" : null,
              ),
              CustomTextFormField(
                label: "Price",
                controller: priceController,
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v!.isEmpty) return "Enter price";
                  final value = double.tryParse(v);
                  if (value == null || value <= 0) {
                    return "Enter a valid positive price";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CategoryRadioGroup(
                selectedCategory: category,
                onChanged: (val) => setState(() => category = val),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final product = ProductData.fromControllers(
                      nameController,
                      serialController,
                      priceController,
                      category,
                    );
                    showResultDialog(
                        context, "Product Registration", product.toMap());
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
