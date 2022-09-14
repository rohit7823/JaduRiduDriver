import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../stores/shared_store.dart';

class AccountsScreen extends StatefulWidget {
  final SharedStore sharedStore;
  const AccountsScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            expand(flex: 2, child: _upperSideContent()),
            expand(flex: 8, child: _lowerSideContent())
          ],
        ),
      ),
    );
  }

  Widget _upperSideContent() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.r))
      ),
      child: Align(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            fitBox(child: StringProvider.accountSummary.text(AppTextStyle.enterNumberStyle)),
            StringProvider.accountSummaryDescription.text(AppTextStyle.enterNumberSubHeadingStyle)
          ],
        ).padding(insets: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sw)),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      alignment: Alignment.topCenter,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
        children: [
          SizedBox(
            width: 0.95.sw,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: AppColors.primaryVariant,
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.03.sw, horizontal: 0.05.sw),
                        child: fitBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StringProvider.lowBalance
                                  .text(AppTextStyle.partnerTextTitle),
                              StringProvider.duesAreNot
                                  .text(AppTextStyle.partnerTextTitle),
                              StringProvider.clearImd
                                  .text(AppTextStyle.partnerTextTitle),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
