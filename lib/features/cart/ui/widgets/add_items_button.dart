import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../nav_bar/cubit/change_page_cubit.dart';
import 'custom_button.dart';

class AddMoreItemsButton extends StatelessWidget {
  const AddMoreItemsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: S.of(context).add_more_items,
      color: AppColors.lightBlue,
      textStyle: AppTextStyles.font20MainBlue700Weight,
      onTap: () => context.read<ChangePageCubit>().changePage(2),
    );
  }
}
