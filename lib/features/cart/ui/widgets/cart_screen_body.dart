import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/is_arabic.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/routing/routes.dart';
import 'package:shuwaikh/core/widgets/custom_error_widget.dart';
import 'package:shuwaikh/core/widgets/custom_loading_widget.dart';
import 'package:shuwaikh/features/cart/logic/get_cart_cubit/get_cart_cubit.dart';
import '../../../../core/widgets/app_scroll_scaffold.dart';
import '../../../../generated/l10n.dart';
import '../../../nav_bar/cubit/change_page_cubit.dart';
import 'add_items_button.dart';
import 'cart_Items_widget.dart';
import 'cart_product_item.dart';
import 'cart_total_widget.dart';
import 'custom_button.dart';
import 'remove_bloc_lisneter.dart';

class CartScreenBody extends StatefulWidget {
  const CartScreenBody({super.key});
  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody> {
  @override
  Widget build(BuildContext context) {
    double? total = 0;
    return AppScrollScaffold(
      appBarTitle: S.of(context).my_cart,
      appBarIcon: Icon(isArabic() ? Icons.arrow_forward : Icons.arrow_back,
          color: Colors.white),
      appBarOnPressed: () => context.read<ChangePageCubit>().changePage(2),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocBuilder<GetCartCubit, GetCartState>(
          builder: (context, state) {
            if (state is GetCartSuccess) {
              for (var i = 0; i < state.cart!.length; i++) {
                total = (total! + double.parse(state.cart![i].total!));
              }
              return Column(
                children: [
                  verticalSpace(30),
                  CountItemWidget(count: state.cart!.length),
                  verticalSpace(20),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: state.cart!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartBroductItem(
                        cartItem: state.cart![index],
                      );
                    },
                  ),
                  verticalSpace(25),
                  const AddMoreItemsButton(),
                  verticalSpace(30),
                  CartTotalWidget(total: total),
                  verticalSpace(30),
                  CustomButton(
                      text: S.of(context).check_out,
                      onTap: () async {
                        if (state.cart!.isEmpty) {
                          customSnackBar(
                              context, S.of(context).cart_empty, true);
                        } else {
                          context
                              .pushNamed(
                            Routes.checkoutScreen,
                            arguments: total,
                          )
                              .then((value) {
                            setState(() {
                              context.read<GetCartCubit>().getCart();
                            });
                          });
                        }
                      }),
                  verticalSpace(100),
                  const RemoveProductBlocListener(),
                ],
              );
            } else if (state is GetCartFailure) {
              return CustomErrorWidget(errMessage: state.errMessage ?? getFail);
            } else {
              return const CustomLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}



                                      //  context
                                      //     .pushNamed(
                                      //   Routes.checkoutScreen,
                                      //   arguments: widget.total,
                                      // )
                                      //     .then((value) {
                                      //   setState(() {
                                      //     context
                                      //         .read<GetCartCubit>()
                                      //         .getCart();
                                      //   });
                                      // });