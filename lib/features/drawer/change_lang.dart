import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';

import '../../core/helpers/spacing.dart';
import '../localization/cubit/locale_cubit.dart';

class ChangeLang extends StatelessWidget {
  const ChangeLang({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
            children: [
              const Icon(Icons.translate),
              horizontalSpace(20),
              BlocConsumer<LocaleCubit, ChangeLocaleState>(
                builder: (context, state) {
                  return DropdownButton<String>(
                    value: state.locale.languageCode,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: ['ar', 'en'].map((String items) {
                      return DropdownMenuItem<String>(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        context.read<LocaleCubit>().changeLanguage(newValue);
                      }
                    },
                  );
                },
                listener: (context, state) {
                  context.pop();
                },
              ),
            ],
          );
  }
}