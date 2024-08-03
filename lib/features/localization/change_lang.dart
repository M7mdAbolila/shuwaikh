import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/helpers/spacing.dart';
import '../../core/theming/styles.dart';
import '../../generated/l10n.dart';
import '../account/ui/widgets/profile_button.dart';
import 'cubit/locale_cubit.dart';

class ChangeLang extends StatefulWidget {
  const ChangeLang({super.key});

  @override
  State<ChangeLang> createState() => _ChangeLangState();
}

class _ChangeLangState extends State<ChangeLang> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).change_lang,
                style: TextStyles.font16Black700Weight,
              ),
              const Icon(Icons.translate),
            ],
          ),
          verticalSpace(10),
          ProfileButton(
            title: 'English',
            onPressed: () => context.read<LocaleCubit>().changeLanguage('en'),
          ),
          verticalSpace(20),
          ProfileButton(
            title: 'عربي',
            onPressed: () => context.read<LocaleCubit>().changeLanguage('ar'),
          ),
        ],
      ),
    );
  }
}
