import 'package:flutter/material.dart';

import '../../core/common/alert_data.dart';
import '../ui/app_text_style.dart';

class ErrorPopUp {
  ErrorPopUp._();

  static show(BuildContext context, AlertData alertData,
      {Function? positive, Function? negative}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(alertData.title, style: AppTextStyle.headingTextStyle),
            content: Text(alertData.message, style: AppTextStyle.bodyTextStyle),
            actions: [
              if (alertData.positive != null)
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      positive?.call();
                    },
                    child: Text(alertData.negative ?? "")),
              if (alertData.negative != null)
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      negative?.call();
                    },
                    child: Text(alertData.negative ?? ""))
            ],
          );
        }).then((value) {
      if (positive != null) positive.call();
      if (negative != null) negative.call();
    });
  }
}
