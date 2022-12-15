import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/error_popup.dart';
import 'package:jadu_ride_driver/presentation/stores/intro_screen_store.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class IntroScreen extends StatefulWidget {
  SharedStore sharedStore;
  IntroScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<IntroScreen> createState() =>
      _IntroScreenState(sharedStore: sharedStore);
}

class _IntroScreenState extends State<IntroScreen> {
  SharedStore sharedStore;
  late final IntroStore _store;
  late final List<ReactionDisposer> _disposers;
  late final CarouselController _carouselController;
  _IntroScreenState({required this.sharedStore});

  @override
  void initState() {
    _store = IntroStore(data: sharedStore.introPageData);
    _carouselController = CarouselController();
    super.initState();

    _disposers = [
      reaction((p0) => sharedStore.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          ChangeScreen.to(context, p0.screen,
              arguments: p0.argument, onComplete: sharedStore.clear);
        }
      }),
      reaction((p0) => sharedStore.dialogManager.currentState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          ErrorPopUp.show(context, sharedStore.dialogManager.errorData!,
              positive: sharedStore.onLoginRegistrationRetry);
        }
      })
    ];
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            CarouselSlider.builder(
                itemCount: sharedStore.introPageData.length,
                carouselController: _carouselController,
                itemBuilder: (context, idx, rIdx) {
                  return idx.getIntroPage(_store);
                },
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  onPageChanged: (page, reason) {
                    debugPrint("page: $page reason: $reason");
                    _store.onChange(page);
                  },
                  viewportFraction: 1,
                  reverse: false,
                  height: double.infinity,
                  scrollPhysics: const BouncingScrollPhysics(),
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: _skipWithIndications(context))
          ],
        ));
  }

  Widget _skipWithIndications(BuildContext context) {
    return SizedBox(
      height: 0.25.sh,
      child: Observer(
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedCrossFade(
                firstChild: SizedBox(child: Observer(builder: (context) {
                  return TextButton(
                      onPressed: sharedStore.gettingDataLoader
                          ? null
                          : sharedStore.getLoginRegistrationPageData,
                      child: Text(
                          sharedStore.gettingDataLoader
                              ? StringProvider.pleaseWait
                              : StringProvider.skip,
                          style: AppTextStyle.bankDetailsTextInputStyle));
                })),
                secondChild: SizedBox(
                    child: ElevatedButton(
                        onPressed: sharedStore.gettingDataLoader
                            ? null
                            : sharedStore.getLoginRegistrationPageData,
                        child: _store.currentPage == _store.data.length - 1
                            ? AnimatedCrossFade(
                                firstChild: const Text(StringProvider.proceed),
                                secondChild: const Text(
                                    StringProvider.pleaseWait,
                                    style: TextStyle(
                                        color: AppColors.primaryVariant)),
                                crossFadeState: sharedStore.gettingDataLoader
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 400))
                            : null)),
                crossFadeState: _store.currentPage != _store.data.length - 1
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.topCenter,
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.05.sw),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _store.data.map(
                    (image) {
                      int index = _store.data.indexOf(image);
                      return GestureDetector(
                        onTap: () => _carouselController.animateToPage(index,
                            duration: const Duration(milliseconds: 400)),
                        child: AnimatedContainer(
                          width: _store.currentPage == index ? 30 : 25,
                          height: _store.currentPage == index ? 8 : 7,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: _store.currentPage == index
                                  ? AppColors.primaryVariant
                                  : AppColors.primaryVariant.withOpacity(.2)),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.elasticIn,
                        ),
                      );
                    },
                  ).toList(),
                ),
              )
            ].whereType<Widget>().toList(),
          );
        },
      ),
    );
  }
}
