import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/is_arabic.dart';
import 'package:shuwaikh/features/cart/ui/widgets/info_widget.dart';

import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../product_details/data/models/addons_model.dart';
import '../../data/models/get_cart/get_cart_response.dart';

class AddonsSection extends StatefulWidget {
  const AddonsSection({super.key, required this.cartItem});
  final CartItem? cartItem;
  @override
  State<AddonsSection> createState() => _AddonsSectionState();
}

class _AddonsSectionState extends State<AddonsSection> {
  @override
  Widget build(BuildContext context) {
    Addons? addons;
    if (widget.cartItem!.addons != null) {
      addons = jsonToAddons();
    }
    return widget.cartItem!.addons == null
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              Text(
                S.of(context).addons,
                style: TextStyles.font16Black500Weight,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: addons!.addons.length,
                itemBuilder: (context, index) {
                  return InfoWidget(
                      title: '${addons?.addons[index].name ?? ''} ',
                      subtitle: 'KD${addons?.addons[index].price}');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isArabic()
                        ? '${S.of(context).total} ${S.of(context).addons}: '
                        : '${S.of(context).addons} ${S.of(context).total}: ',
                    style: TextStyles.font16Black400Weight,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'KD${widget.cartItem?.addonsPrice}',
                    style: TextStyles.font18Blue500Weight,
                  ),
                ],
              ),
            ],
          );
  }

  Addons jsonToAddons() {
    String? jsonString = widget.cartItem!.addons;
    final jsonData = jsonDecode(jsonString!);
    final addons = Addons.fromJson(jsonData);
    return addons;
  }
}
