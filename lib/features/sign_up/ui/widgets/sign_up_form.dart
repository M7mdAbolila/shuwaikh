import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/app_regex.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/widgets/app_text_field.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_auth_button.dart';
import '../../../../generated/l10n.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isObscureText = true;
  bool confirmtIsObscureText = true;
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
            hintText: S.of(context).username,
            controller: userNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).enter_valid_username;
              } else if (value.length < 3) {
                return S.of(context).username_must_over_3;
              }
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: S.of(context).email,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return S.of(context).enter_valid_email;
              }
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: S.of(context).phome_number,
            keyboardType: TextInputType.number,
            controller: phoneController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return S.of(context).enter_valid_phone;
              }
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: S.of(context).password,
            controller: passwordController,
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return S.of(context).enter_valid_pass;
              }
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: S.of(context).confirm_pass,
            isObscureText: confirmtIsObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  confirmtIsObscureText = !confirmtIsObscureText;
                });
              },
              child: Icon(
                confirmtIsObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  passwordController.text != value) {
                return S.of(context).not_match;
              }
            },
          ),
          verticalSpace(30),
          AppAuthButton(
            text: S.of(context).sign_up,
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
