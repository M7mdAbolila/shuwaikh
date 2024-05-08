import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/widgets/custom_error_widget.dart';
import 'package:shuwaikh/core/widgets/custom_loading_widget.dart';
import 'package:shuwaikh/features/offer/logic/cubit/offer_details_cubit.dart';

import '../../../core/helpers/app_regex.dart';
import '../../../core/theming/styles.dart';
import '../../../generated/l10n.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key, required this.id});
  final int? id;
  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OfferDetailsCubit>().getOfferDetails(widget.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorsManager.blue),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<OfferDetailsCubit, OfferDetailsState>(
        builder: (context, state) {
          if (state is OfferDetailsSuccess) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          '$offerPath${state.offerDetailsResponse.data!.image}'),
                  verticalSpace(30),
                  Text(
                    state.offerDetailsResponse.data!.title ?? '',
                    style: TextStyles.font24Black700Weight,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${S.of(context).price} ',
                          style: TextStyles.font20Black500Weight,
                        ),
                        TextSpan(
                          text: 'KD${state.offerDetailsResponse.data!.price}',
                          style: TextStyles.font26Blue700Weight,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(10),
                  Text(
                    AppRegex.removeHtmlTags(
                        state.offerDetailsResponse.data!.description ?? ''),
                    style: TextStyles.font13Black500Weight,
                    maxLines: 13,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(10),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${S.of(context).expired}: ',
                          style: TextStyles.font14Black400Weight,
                        ),
                        TextSpan(
                          text: state.offerDetailsResponse.data!.endData ?? '',
                          style: TextStyles.font16Blue400Weight,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is OfferDetailsFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const CustomLoadingWidget();
          }
        },
      ),
    );
  }
}
