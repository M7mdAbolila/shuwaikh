import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/app_regex.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/widgets/app_text_field.dart';
import 'package:shuwaikh/features/sign_up/logic/cubit/signup_cubit.dart';

import '../../../../generated/l10n.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isObscureText = true;
  bool confirmtIsObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: S.of(context).username,
            controller: context.read<SignupCubit>().usernameController,
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
            controller: context.read<SignupCubit>().emailController,
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
            controller: context.read<SignupCubit>().phoneController,
            validator: (value) {
              if (value == null || value.isEmpty
                  // || !AppRegex.isPhoneNumberValid(value) 8 +965
                  ) {
                return S.of(context).enter_valid_phone;
              }
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: S.of(context).password,
            controller: context.read<SignupCubit>().passwordController,
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
              if (value == null || value.isEmpty
                  // ||!AppRegex.isPasswordValid(value)
                  ) {
                return S.of(context).enter_valid_pass;
              }
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            hintText: S.of(context).confirm_pass,
            controller:
                context.read<SignupCubit>().passwordConfirmationController,
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
                  context.read<SignupCubit>().passwordController.text !=
                      value) {
                return S.of(context).not_match;
              }
            },
          ),
        ],
      ),
    );
  }
}
