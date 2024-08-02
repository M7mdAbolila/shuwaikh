import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shuwaikh/features/update%20info/logic/update_profile_cubit/update_profile_cubit.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/custom_loading_widget.dart';

class UpdatePhotoWidget extends StatefulWidget {
  const UpdatePhotoWidget({
    super.key,
    this.photo,
  });
  final String? photo;
  @override
  State<UpdatePhotoWidget> createState() => _UpdatePhotoWidgetState();
}

class _UpdatePhotoWidgetState extends State<UpdatePhotoWidget> {
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          _selectedImage == null
              ? widget.photo != null
                  ? CachedNetworkImage(
                      imageUrl: '${ImagesPaths.userPhotoPath}${widget.photo}',
                      placeholder: (context, url) =>
                          const CustomLoadingWidget(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        size: 20,
                      ),
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          height: 150.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2.w,
                              color: ColorsManager.blue,
                            ),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    )
                  : Container(
                      height: 150.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: ColorsManager.blue,
                        ),
                      ),
                    )
              : Container(
                  height: 150.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.w,
                      color: ColorsManager.blue,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: FileImage(_selectedImage!),
                    ),
                  ),
                ),
          GestureDetector(
            onTap: () {
              _pickImageFromGallery();
            },
            child: CircleAvatar(
              backgroundColor: ColorsManager.blue,
              radius: 25.r,
              child: const Icon(
                Icons.edit_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;

    setState(() {
      _selectedImage = File(pickedImage.path);
      context.read<UpdateProfileCubit>().photo = File(pickedImage.path);
    });
  }
}
