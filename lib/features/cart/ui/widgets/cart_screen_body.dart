import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/is_arabic.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/core/widgets/custom_error_widget.dart';
import 'package:shuwaikh/core/widgets/custom_loading_widget.dart';
import 'package:shuwaikh/features/cart/logic/get_cart_cubit/get_cart_cubit.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_scroll_scaffold.dart';
import '../../../../generated/l10n.dart';
import '../../../nav_bar/cubit/change_page_cubit.dart';
import 'cart_product_item.dart';
import 'custom_button.dart';
import 'remove_bloc_lisneter.dart';

class CartScreenBody extends StatefulWidget {
  const CartScreenBody({super.key});

  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<GetCartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return AppScrollScaffold(
      appBarTitle: S.of(context).my_cart,
      appBarIcon: Icon(isArabic() ? Icons.arrow_forward : Icons.arrow_back,
          color: Colors.white),
      appBarOnPressed: () => context.read<ChangePageCubit>().changePage(2),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<GetCartCubit, GetCartState>(
          builder: (context, state) {
            if (state is GetCartSuccess) {
              double? total = 0;
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
                  CustomButton(
                    text: S.of(context).add_more_items,
                    color: ColorsManager.lightBlue,
                    textStyle: TextStyles.font20MainBlue700Weight,
                    onTap: () => context.read<ChangePageCubit>().changePage(2),
                  ),
                  verticalSpace(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${S.of(context).total}:',
                        style: TextStyles.font22Grey700Weight,
                      ),
                      Text(
                        'KD ${total!.toStringAsFixed(2)}',
                        style: TextStyles.font24Black700Weight,
                      ),
                    ],
                  ),
                  verticalSpace(30),
                  CustomButton(text: S.of(context).check_out),
                  verticalSpace(30),
                  const RemoveProductBlocListener(),
                ],
              );
            } else if (state is GetCartFailure) {
              return CustomErrorWidget(errMessage: state.errMessage ?? '');
            } else {
              return const CustomLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}

class CountItemWidget extends StatelessWidget {
  const CountItemWidget({
    super.key,
    required this.count,
  });
  final int count;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        '$count ${S.of(context).items}',
        style: TextStyles.font18MainBlue500Weight.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: ColorsManager.mainBlue,
        ),
      ),
    );
  }
}
