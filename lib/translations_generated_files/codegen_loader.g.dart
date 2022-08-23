// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> bn = {
  "enter_your_phone_number": "আপনার\nফোন নম্বর লিখুন",
  "select_preffered_language": "আপনার পছন্দের ভাষা\nনির্বাচন করুন",
  "language_changed_successfully": "ভাষা সফলভাবে পরিবর্তিত হয়েছে৷"
};
static const Map<String,dynamic> en = {
  "enter_your_phone_number": "Enter your\nphone number",
  "select_preffered_language": "Select Your\npreferred language",
  "language_changed_successfully": "Language changed Successfully"
};
static const Map<String,dynamic> hi = {
  "enter_your_phone_number": "अपना दूरभाष\nक्रमांक दर्ज करें",
  "select_preffered_language": "आपकी पसंदीदा भाषा\nचुनते हैं",
  "language_changed_successfully": "लैनुएज सफलतापूर्वक बदला गया।"
};
static const Map<String,dynamic> mr = {};
static const Map<String,dynamic> ne = {};
static const Map<String,dynamic> sd = {};
static const Map<String, Map<String,dynamic>> mapLocales = {"bn": bn, "en": en, "hi": hi, "mr": mr, "ne": ne, "sd": sd};
}
