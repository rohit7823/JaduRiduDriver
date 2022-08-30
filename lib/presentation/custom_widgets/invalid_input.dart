import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui/app_text_style.dart';

class InvalidInput extends StatelessWidget {
  String invalidText;
  InvalidInput({Key? key, required this.invalidText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 300),
      child: invalidText.isNotEmpty
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 0.03.sw),
              child: Text(
                invalidText,
                style: AppTextStyle.errorStyle,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
