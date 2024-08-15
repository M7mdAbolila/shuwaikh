import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/features/login/logic/login_cubit/login_cubit.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../generated/l10n.dart';

class UsernameAndPassword extends StatefulWidget {
  const UsernameAndPassword({super.key});

  @override
  State<UsernameAndPassword> createState() => _UsernameAndPasswordState();
}

class _UsernameAndPasswordState extends State<UsernameAndPassword> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: S.of(context).username,
            controller: context.read<LoginCubit>().usernameController,
            keyboardType: TextInputType.name,
            prefixIcon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(
                Assets.userAvatar,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).enter_valid_email;
              }
            },
          ),
          verticalSpace(32),
          AppTextFormField(
            hintText: S.of(context).password,
            controller: context.read<LoginCubit>().passwordController,
            keyboardType: TextInputType.visiblePassword,
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
              if (value == null || value.isEmpty) {
                return S.of(context).enter_valid_pass;
              }
            },
          ),
        ],
      ),
    );
  }
}
