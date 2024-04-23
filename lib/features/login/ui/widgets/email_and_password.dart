import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: 'Email',
          prefixIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              'assets/icons/user-avatar.svg',
            ),
          ),
          validator: (value) {},
        ),
         verticalSpace(32),
        AppTextFormField(
          hintText: 'Password',
          prefixIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              'assets/icons/password.svg',
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
          validator: (value) {},
        ),
      ],
    );
  }
}
