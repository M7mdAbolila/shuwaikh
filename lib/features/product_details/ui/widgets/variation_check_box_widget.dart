// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shuwaikh/features/product_details/data/models/variation_model.dart';

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shuwaikh/features/cart/logic/add_to_cart_cubit/add_to_cart_cubit.dart';

// import '../../../../core/theming/colors.dart';
// import '../../../../core/theming/styles.dart';

// class VariationWidget extends StatefulWidget {
//   const VariationWidget({
//     super.key,
//     required this.size,
//     this.group,
//   });
//   final Size? size;
//   final String? group;

//   @override
//   State<VariationWidget> createState() => _VariationWidgetState();
// }

// class _VariationWidgetState extends State<VariationWidget> {
//   bool? isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(
//           width: 200.w,
//           child: RadioListTile(
//             title: Text(widget.size!.name),
//             value: widget.size!.name,
//             groupValue: widget.group,
//             onChanged: (value) {
//               widget.group = value;
//             },
//           ),
//         ),
//         Checkbox(
//             value: isChecked,
//             activeColor: ColorsManager.blue,
//             onChanged: (check) {
//               setState(() {
//                 isChecked = check;
//                 context.read<AddToCartCubit>().variations = sizeToJson();
//                 context.read<AddToCartCubit>().variationsPrice =
//                     widget.size!.price as double?;
//               });
//             }),
//         // Text(
//         //   widget.size!.name,
//         //   style: TextStyles.font16Gray400Weight,
//         // ),
//         Text('+ KD${widget.size!.price}'),
//       ],
//     );
//   }

//   String sizeToJson() {
//     String jsonString = jsonEncode(widget.size!.toJson());
//     return jsonString;
//   }
// }
