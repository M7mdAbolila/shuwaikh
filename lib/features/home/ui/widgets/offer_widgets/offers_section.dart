import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/features/home/logic/get_offers_cubit/get_offers_cubit.dart';
import 'package:shuwaikh/generated/l10n.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import 'no_offer_found.dart';
import 'offer_shimmer_loading.dart';
import 'offers_carouel_slider.dart';

class OffersSection extends StatefulWidget {
  const OffersSection({super.key});

  @override
  State<OffersSection> createState() => _OffersSectionState();
}

class _OffersSectionState extends State<OffersSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).your_offers,
          style: AppTextStyles.font24MainBlue500Weight,
        ),
        verticalSpace(15),
        BlocBuilder<GetOffersCubit, GetOffersState>(
          builder: (context, state) {
            if (state is GetOffersSuccess) {
              return Column(
                children: [
                  state.offers!.isEmpty
                      ? const NoOffersFound()
                      : OffersCarouelSlider(
                          offers: state.offers!,
                        ),
                ],
              );
            } else if (state is GetOffersFailure) {
              return CustomErrMessageWidget(
                errMessage: state.errMessage,
              );
            } else {
              return const OfferShimmerLoading();
            }
          },
        ),
      ],
    );
  }
}
