import 'package:flutter/material.dart';
import 'package:shuwaikh/features/product_details/data/models/addons_model.dart';
import 'package:shuwaikh/features/product_details/ui/widgets/addons_check_box_widget.dart';

import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class SelectAddons extends StatefulWidget {
  const SelectAddons({super.key, required this.addons});
  final Addons? addons;
  @override
  State<SelectAddons> createState() => _SelectAddonsState();
}

class _SelectAddonsState extends State<SelectAddons> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).select_add_ons,
          style: TextStyles.font24Black500Weight,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.addons!.addons.length,
          itemBuilder: (context, index) {
            return AddonsCheckBoxWidget(
              addon: widget.addons!.addons[index],
            );
          },
        ),
      ],
    );
  }
}
