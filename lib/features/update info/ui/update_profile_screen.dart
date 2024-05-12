import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/generated/l10n.dart';

import '../../cart/ui/widgets/custom_button.dart';
import '../../account/ui/widgets/profile_text_field.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(50),
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorsManager.blue,
                    ),
                  ),
                ),
              ),
              verticalSpace(40),
              ProfileTextField(lableText: S.of(context).username),
              ProfileTextField(lableText: S.of(context).phome_number),
              ProfileTextField(lableText: S.of(context).email),
              verticalSpace(50),
              const CustomButton(
                text: 'UPDATE ',
                color: ColorsManager.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
