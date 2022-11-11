import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import '../stores/partner_care_view_model.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _msgController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  late final PartnerCareStore partnerCareStore;

  late FocusNode _emailFocusNode;
  late FocusNode _nameFocusNode;
  late FocusNode _subjectFocusNode;
  late FocusNode _msgFocusNode;


  @override
  void initState() {
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _subjectFocusNode = FocusNode();
    _msgFocusNode = FocusNode();
    partnerCareStore = PartnerCareStore();
    partnerCareStore.validateInput();
    partnerCareStore.validateInputMessage();
    super.initState();

    _nameFocusNode.addListener(() {
      if(_nameFocusNode.hasFocus){
        widget.sharedStore.hidePartnercarerNav(_nameFocusNode.hasFocus);
      }
      // if(_nameFocusNode.){
      //
      // }
    });



  }

  @override
  void dispose() {

    super.dispose();
    _emailController.dispose();
    _msgController.dispose();
    _nameController.dispose();
    _subjectController.dispose();

  }

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
                    controller: _nameController,
                    focusNode:_nameFocusNode ,
                    decoration:  InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide( width: 1,),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide( width: 1,),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: 'Your Name',
                    ),
                    onChanged: partnerCareStore.onName,
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  focusNode:_emailFocusNode ,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide( width: 1,),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide( width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: 'Email',
                  ),
                  onChanged: partnerCareStore.onEmail,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.05.sw),
                  child: Observer(builder: (context) {

                    if(partnerCareStore.errorMsg.isNotEmpty){
                      return Text(partnerCareStore.errorMsg,
                      style: const TextStyle(color: Colors.red),);
                    }
                    return const SizedBox.shrink();
                  }),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.05.sw),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    controller: _subjectController,
                    focusNode:_subjectFocusNode ,
                    decoration:  InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide( width: 1,),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide( width: 1,),
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Subject',
                    ),
                    onChanged: partnerCareStore.onSubject,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.05.sw),
                  child: TextField(

                    maxLines: 4,
                    controller: _msgController,
                    focusNode:_msgFocusNode ,
                    decoration:  InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide( width: 1,),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide( width: 1,),
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Message',

                    ),
                    onChanged: partnerCareStore.onMessage,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0.05.sw),
                  child: Observer(builder: (context) {

                    if(partnerCareStore.errorMessageMsg.isNotEmpty){
                      return Text(partnerCareStore.errorMessageMsg,
                        style: const TextStyle(color: Colors.red),);
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
                  onPressed: (){
                    partnerCareStore.onPressed(_nameController, _emailController, _subjectController, _msgController);
                  },

                  style:AppButtonThemes.defaultStyle.copyWith(backgroundColor: MaterialStateProperty.all(AppColors.primaryVariant)),
                  child: partnerCareStore.isLoading? const CircularProgressIndicator(color: Colors.white,):
                  StringProvider.submitBtn.text(AppTextStyle.partnerButtonTxt),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
