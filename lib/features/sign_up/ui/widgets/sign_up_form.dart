import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/widgets/app_text_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(hintText: 'User Name', validator: (value) {}),
        verticalSpace(15),
        AppTextFormField(hintText: 'Email', validator: (value) {}),
        verticalSpace(15),
        AppTextFormField(hintText: 'Phone number', validator: (value) {}),
        verticalSpace(15),
        AppTextFormField(hintText: 'Password', validator: (value) {}),
        verticalSpace(15),
        AppTextFormField(hintText: 'Confirm password', validator: (value) {}),
      ],
    );
  }
}
