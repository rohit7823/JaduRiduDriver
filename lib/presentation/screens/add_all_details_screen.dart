import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/helpers_impls/error_dialog_impl.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/stores/add_all_details_screen_store.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class AddAllDetailsScreen extends StatefulWidget {
  SharedStore sharedStore;
  AddAllDetailsScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<AddAllDetailsScreen> createState() => _AddAllDetailsScreenState();
}

class _AddAllDetailsScreenState extends State<AddAllDetailsScreen> {
  late final AddAllDetailsStore _store;
  late final DialogController _dialogController;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store = AddAllDetailsStore();
    _dialogController =
        DialogController(dialog: ErrorDialogImpl(buildContext: context));
    super.initState();

    _disposers = [];
  }

  @override
  void dispose() {
    for (var element in _disposers) {
      element();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          expand(child: _upperSideContent(), flex: 2),
          expand(flex: 8, child: _lowerSideContent())
        ],
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
              "${StringProvider.welcome} ${_store.userName}!"
                  .text(AppTextStyle.enterNumberStyle, TextOverflow.ellipsis)
                  .padding(insets: EdgeInsets.only(bottom: 0.03.sw)),
              StringProvider.pleaseCompleteRequied
                  .text(AppTextStyle.enterNumberSubHeadingStyle)
            ],
          ).padding(
              insets:
                  EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.03.sw)),
        ),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [],
      ),
    );
  }
}
