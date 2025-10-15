import 'package:flutter/material.dart';

class UserData {
  final String name;
  final String email;
  final int age;
  final String gender;

  UserData(this.name, this.email, this.age, this.gender);

  factory UserData.fromControllers(
      TextEditingController name, TextEditingController email, TextEditingController age, String gender) {
    return UserData(name.text, email.text, int.parse(age.text), gender);
  }

  Map<String, dynamic> toMap() => {
    "Name": name,
    "Email": email,
    "Age": age,
    "Gender": gender,
  };
}
