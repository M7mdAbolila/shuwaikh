import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/features/localization/change_lang.dart';
import 'package:shuwaikh/features/setting/logic/cubit/delete_account_cubit.dart';
import 'package:shuwaikh/features/setting/ui/widgets/delete_acc_bloc_listner.dart';

import '../../../core/helpers/setup_dialogs.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../generated/l10n.dart';
import '../../account/ui/widgets/profile_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          S.of(context).setting,
          style: AppTextStyles.font20White700Weight,
        ),
        backgroundColor: AppColors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            verticalSpace(50),
            ProfileButton(
              title: S.of(context).edit_billing,
              onPressed: () {
                context.pushNamed(Routes.updateBillingDetails);
              },
            ),
            verticalSpace(25),
            const Divider(),
            verticalSpace(25),
            ProfileButton(
              title: S.of(context).edit_shipping,
              onPressed: () {
                context.pushNamed(Routes.updateShippingDetails);
              },
            ),
            verticalSpace(25),
            const Divider(),
            verticalSpace(10),
            const ChangeLang(),
            verticalSpace(15),
            const Divider(),
            verticalSpace(25),
            ProfileButton(
              title: S.of(context).delete_acc,
              onPressed: () {
                deleteAccountDialog(
                  context, 
                  () {
                    context.read<DeleteAccountCubit>().deleteAcount();
                  },
                );
              },
            ),
            const DeleteAccBlocListner(),
          ],
        ),
      ),
    );
  }
}
