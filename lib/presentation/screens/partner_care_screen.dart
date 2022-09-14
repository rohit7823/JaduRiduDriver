import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../ui/app_text_style.dart';
import '../ui/theme.dart';

class PartnerCareScreen extends StatefulWidget {
  final SharedStore sharedStore;

  const PartnerCareScreen({Key? key, required this.sharedStore})
      : super(key: key);

  @override
  State<PartnerCareScreen> createState() => _PartnerCareScreenState();
}

class _PartnerCareScreenState extends State<PartnerCareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            expand(flex: 2, child: _upperSideContent()),
            expand(flex: 8, child: _lowerSideContent()),
          ],
        ),
      ),
    );
  }

  Widget _upperSideContent() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.r))),
      child: Align(
        alignment: Alignment.topLeft,
        child: fitBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StringProvider.partnerCare
                  .text(AppTextStyle.enterNumberStyle),
              StringProvider.accountSummaryDescription
                  .text(AppTextStyle.enterNumberSubHeadingStyle)
            ],
          ).padding(
              insets:
                  EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sw)),
        ),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Column(
      children: [
        expand(
            flex: 9,
            child: ListView(
              padding:
                  EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 0.05.sw),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    //controller: nameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Your Name',
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.05.sw),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    //controller: nameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
                /*Padding(
                  padding: EdgeInsets.only(bottom: 0.05.sw),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    //controller: nameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Subject',
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),*/
                Padding(
                  padding: EdgeInsets.only(bottom: 0.05.sw),
                  child: TextField(

                    maxLines: 4,
                    //controller: nameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Message',
                    ),
                  ),
                ),
              ],
            )),
        expand(
          flex: 2,
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {},
              
              style:AppButtonThemes.defaultStyle.copyWith(backgroundColor: MaterialStateProperty.all(AppColors.primaryVariant)),
              child: StringProvider.submitBtn.text(AppTextStyle.partnerButtonTxt),
            ),
          ),
        )
      ],
    );
  }
}

/*//this is for svg.....................................
//SvgPicture.asset(ImageAssets.todaysPayment)
//this is for png........................................
//Image.asset(ImageAssets.googleLogoPng)*/
