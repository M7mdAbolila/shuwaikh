import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../generated/l10n.dart';
import '../../cart/ui/widgets/custom_button.dart';

class UpdateBillingScreen extends StatelessWidget {
  const UpdateBillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: 15.w,
            left: 15.w,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).first_name, validator: (j) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).last_name, validator: (v) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).address, validator: (v) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).city, validator: (v) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).contact_email, validator: (v) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).phome_number, validator: (v) {}),
                verticalSpace(50),
                const CustomButton(
                  text: 'UPDATE ',
                  color: ColorsManager.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
