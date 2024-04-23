import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/app_regex.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/widgets/app_text_field.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_auth_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isObscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'User Name',
            controller: userNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid user name';
              } else if (value.length < 3) {
                return 'User name must over 3 characters';
              }
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: 'Email',
            controller: emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: 'Phone number',
            controller: phoneController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: 'Password',
            controller: passwordController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: 'Confirm password',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  passwordController.text != value) {
                return 'Password confirmation does not match';
              }
            },
          ),
          verticalSpace(30),
          AppAuthButton(
            text: 'Sign up',
            onTap: () {
              if (formKey.currentState!.validate()) {
                context.pushNamed(Routes.otp);
              }
            },
          ),
        ],
      ),
    );
  }
}
