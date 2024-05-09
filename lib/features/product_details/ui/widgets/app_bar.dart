
import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';

import '../../../../core/helpers/is_arabic.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: isArabic() ? Alignment.centerRight : Alignment.centerLeft,
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }
}
