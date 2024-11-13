import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../di/service_locator.dart';
import '../view_models/form_field_viewmodel.dart';

class FormFieldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<FormFieldViewModel>(),  // Provide FormFieldViewModel to the widget tree
      child: Consumer<FormFieldViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Form Field Example"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    FormField<String>(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        } else if (value.length < 4) {
                          return 'Username must be at least 4 characters';
                        }
                        return null;
                      },
                      onSaved: (value) => viewModel.setUsername(value ?? ''),
                      builder: (FormFieldState<String> field) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              onChanged: field.didChange,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                errorText: field.errorText,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (viewModel.validateFormField()) {
                          // Handle successful validation
                          print("FormField Validated: Username: ${viewModel.username}");
                        } else {
                          print("FormField validation failed");
                        }
                      },
                      child: Text("Submit"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
