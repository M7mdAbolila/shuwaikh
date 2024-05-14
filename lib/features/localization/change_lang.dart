import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/features/account/ui/account_screen.dart';
import '../../core/helpers/spacing.dart';
import '../../core/theming/styles.dart';
import '../../generated/l10n.dart';
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
              // horizontalSpace(20),
              // BlocBuilder<LocaleCubit, ChangeLocaleState>(
              //   builder: (context, state) {
              //     return DropdownButton<String>(
              //       value: state.locale.languageCode,
              //       icon: const Icon(Icons.keyboard_arrow_down),
              //       items: ['ar', 'en'].map((String items) {
              //         return DropdownMenuItem<String>(
              //           value: items,
              //           child: Text(items),
              //         );
              //       }).toList(),
              //       onChanged: (String? newValue) {
              //         if (newValue != null) {
              //           context.read<LocaleCubit>().changeLanguage(newValue);
              //         }
              //       },
              //     );
              //   },
              // ),
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
