import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../custom_widgets/my_app_bar_without_logo.dart';
import '../stores/help_view_model.dart';
import '../ui/app_button_themes.dart';
import '../ui/app_text_style.dart';
import '../ui/string_provider.dart';
import '../ui/theme.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  late final HelpStore helpStore;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _msgController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  @override
  void initState() {
    helpStore = HelpStore();
    helpStore.validateInput();
    helpStore.validateInputMessage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _msgController.dispose();
    _nameController.dispose();
    _subjectController.dispose();
  }

  makingPhoneCall() async {
    var url = Uri.parse("9800771774");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWithOutLogo(),
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
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.r))),
      child: Align(
        alignment: Alignment.topLeft,
        child: fitBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StringProvider.helpTxt.text(AppTextStyle.enterNumberStyle),
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
      child: Column(
        children: [
          expand(
              flex: 9,
              child: ListView(
                padding: EdgeInsets.symmetric(
                    vertical: 0.05.sw, horizontal: 0.05.sw),
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1a000000),
                              blurRadius: 20,
                              spreadRadius: 0,
                              offset: Offset(0, 10))
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.05.sw, horizontal: 0.05.sw),
                      child: Column(
                        children: [
                          StringProvider.tollFreeMobileNumber
                              .text(AppTextStyle.tollFreeMobileStyle),
                          Observer(builder: (BuildContext context) {
                              return helpStore.helpPhoneNumber
                                  .text(AppTextStyle.helpMobileStyle);
                            //}
                          }),
                          ElevatedButton(
                            onPressed: () =>launchUrl(Uri.parse("tel://${helpStore.helpPhoneNumber}")),
                            style: AppButtonThemes.defaultStyle.copyWith(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.primaryVariant)),
                            child: StringProvider.callNowTxt
                                .text(AppTextStyle.helpNumberTxt),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.03.sw,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: StringProvider.orTxt.text(AppTextStyle.orTxtStyle),
                  ),
                  SizedBox(
                    height: 0.03.sw,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0.05.sw),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      controller: _nameController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        labelText: 'Your Name',
                      ),
                      onChanged: helpStore.onName,
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    onChanged: helpStore.onEmail,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0.05.sw),
                    child: Observer(builder: (context) {
                      if (helpStore.errorMsg.isNotEmpty) {
                        return Text(
                          helpStore.errorMsg,
                          style: const TextStyle(color: Colors.red),
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0.05.sw),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _subjectController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        labelText: 'Subject',
                      ),
                      onChanged: helpStore.onSubject,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0.05.sw),
                    child: TextField(
                      maxLines: 4,
                      controller: _msgController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        labelText: 'Message',
                      ),
                      onChanged: helpStore.onMessage,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0.05.sw),
                    child: Observer(builder: (context) {
                      if (helpStore.errorMessageMsg.isNotEmpty) {
                        return Text(
                          helpStore.errorMessageMsg,
                          style: const TextStyle(color: Colors.red),
                        );
                      }
                      return const SizedBox.shrink();
                    }),
                  ),
                ],
              )),
          expand(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: Observer(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    onPressed: () {
                      helpStore.onPressed(_nameController, _emailController,
                          _subjectController, _msgController);
                    },
                    style: AppButtonThemes.defaultStyle.copyWith(
                        backgroundColor: MaterialStateProperty.all(
                            AppColors.secondaryVariant)),
                    child: helpStore.isLoader
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : StringProvider.submitBtn
                            .text(AppTextStyle.partnerButtonTxt),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
