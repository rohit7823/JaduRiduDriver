import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';

class ImageViewer extends StatelessWidget {
  File? selectedImage;
  VoidCallback onClose;
  ImageViewer({Key? key, required this.selectedImage, required this.onClose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (selectedImage != null) {
      return Padding(
        padding: EdgeInsets.only(bottom: 0.05.sw),
        child: AnimatedContainer(
          width: 0.90.sw,
          height: 0.20.sh,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.lightGray),
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut,
          alignment: Alignment.topCenter,
          child: selectedImage != null
              ? Stack(
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.topRight,
                  children: [
                      Image.file(selectedImage!),
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: onClose,
                        color: AppColors.primaryVariant,
                        splashColor: AppColors.lightGray,
                        splashRadius: 20,
                      )
                    ])
              : const SizedBox.shrink(),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
