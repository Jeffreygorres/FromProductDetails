import 'package:flutter/material.dart';
import '../widgets/form_fields.dart';
import '../widgets/result_dialog.dart';
import '../models/user_data.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({super.key});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  String gender = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Registration")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                label: "Full Name",
                controller: nameController,
                validator: (value) =>
                value!.isEmpty ? "Please enter your name" : null,
              ),
              CustomTextFormField(
                label: "Email",
                controller: emailController,
                validator: (value) =>
                value!.isEmpty ? "Please enter your email" : null,
              ),
              CustomTextFormField(
                label: "Age",
                controller: ageController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) return "Enter your age";
                  if (int.tryParse(value) == null || int.parse(value) <= 0) {
                    return "Age must be a positive number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text("Gender: "),
                  Expanded(
                    child: Row(
                      children: [
                        Radio(
                          value: "Male",
                          groupValue: gender,
                          onChanged: (val) => setState(() => gender = val!),
                        ),
                        const Text("Male"),
                        Radio(
                          value: "Female",
                          groupValue: gender,
                          onChanged: (val) => setState(() => gender = val!),
                        ),
                        const Text("Female"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final user = UserData.fromControllers(
                        nameController, emailController, ageController, gender);
                    showResultDialog(context, "User Registration", user.toMap());
                  }
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
