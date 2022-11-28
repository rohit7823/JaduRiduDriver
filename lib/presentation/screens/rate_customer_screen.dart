import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/domain/ride_ids.dart';
import 'package:jadu_ride_driver/helpers_impls/my_dialog_impl.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_button.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_snack_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/stores/rate_customer_store.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class RateCustomerScreen extends StatefulWidget {
  RideIds rideIds;
  SharedStore sharedStore;

  RateCustomerScreen(
      {Key? key, required this.rideIds, required this.sharedStore})
      : super(key: key);

  @override
  State<RateCustomerScreen> createState() => _RateCustomerScreenState();
}

class _RateCustomerScreenState extends State<RateCustomerScreen> {
  late final RateCustomerStore _store;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _controller;

  @override
  void initState() {
    _store = RateCustomerStore(widget.rideIds);
    _controller = DialogController(dialog: MyDialogImpl(buildContext: context));
    super.initState();

    _disposers = [
      reaction((p0) => _store.dialogMgr.currentErrorState, (p0) {
        if (p0 == DialogState.displaying) {
          _controller.show(_store.dialogMgr.errorData!, p0,
              positive: _store.onError,
              close: _store.dialogMgr.closeErrorDialog);
        }
      }),
      reaction((p0) => _store.informer.currentMsg, (p0) {
        if (p0.isNotEmpty) {
          AppSnackBar.show(context, message: p0, clear: _store.informer.clear);
        }
      }),
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null) {
          dependency<ChangeScreen>().from(context, p0.screen, onCompleted: _store.clear);
        }
      })
    ];
  }

  @override
  void dispose() {
    for (var element in _disposers) {
      element.call();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(isPop: true),
      body: SafeArea(
          child: Stack(
        children: [
          expand(flex: 1, child: _background()),
          expand(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 0.90.sw,
                      height: 0.60.sh,
                      padding: EdgeInsets.all(0.05.sw),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.white,
                          boxShadow: allShadow()),
                      child: Column(
                        children: [
                          StringProvider.rateYourCustomer
                              .text(AppTextStyle.driveDocumentNameStyle
                                  .copyWith(color: AppColors.lightGray))
                              .paddings(bottom: 0.03.sw),
                          widget.rideIds.customerName
                              .text(AppTextStyle.rechargeDoneStyle)
                              .paddings(bottom: 0.03.sw),
                          RatingBar.builder(
                            initialRating: 3,
                            itemSize: 0.08.sw,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 3),
                            onRatingUpdate: _store.onCustomerRating,
                            itemBuilder: (context, _) {
                              return Icon(
                                Icons.star,
                                color: Theme.of(context).primaryColor,
                              );
                            },
                          ).paddings(bottom: 0.05.sw),
                          Container(
                            height: 0.20.sh,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF3F3F3),
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                //controller: inputController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(16.r),
                                      gapPadding: 10,
                                    ),
                                    fillColor: const Color(0xFFF3F3F3),
                                    contentPadding: EdgeInsets.all(0.03.sw),
                                    filled: true,
                                    hintText: StringProvider
                                        .saySomethingAboutYourExp),
                                onChanged: _store.onCustomerReview,
                              ),
                            ),
                          ).paddings(bottom: 0.05.sw),
                        ],
                      ),
                    ),
                    Observer(
                      builder: (BuildContext context) => AppButton(
                        key: ObjectKey(_store.uploadingReviewLoader),
                        onClick: _store.submitReview,
                        label: StringProvider.submit,
                        enable: _store.enableBtn,
                        showLoading: _store.uploadingReviewLoader,
                      ),
                    )
                  ],
                ).paddings(vertical: 0.10.sw),
              ))
        ],
      )),
    );
  }

  Widget _background() {
    return Column(
      children: [
        expand(
            flex: 3,
            child: Container(
              width: 1.sw,
              color: AppColors.primary,
            )),
        expand(flex: 7, child: Container(width: 1.sw, color: AppColors.white))
      ],
    );
  }
}
