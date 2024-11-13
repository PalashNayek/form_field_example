import 'package:flutter/material.dart';

class FormFieldViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String _username = '';

  String get username => _username;

  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  bool validateFormField() {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      return true;
    }
    return false;
  }
}
