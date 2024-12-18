import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_auth_button.dart';
import '../../../../core/widgets/app_text_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(
                Assets.userAvatar,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpace(32),
          AppTextFormField(
            hintText: 'Password',
            controller: passwordController,
            prefixIcon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(
                Assets.password,
              ),
            ),
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
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(85),
          AppAuthButton(
            text: 'Sign In',
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
