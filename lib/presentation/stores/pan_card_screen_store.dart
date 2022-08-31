import 'dart:io';

import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/helpers_impls/image_file_picker.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

import '../../core/repository/pan_card_repository.dart';

part 'pan_card_screen_store.g.dart';

class PanCardStore = _PanCardScreenStore with _$PanCardStore;

abstract class _PanCardScreenStore with Store {
  final _repository = dependency<PanCardRepository>();
  final _storage = dependency<Storage>();
  final _imagePicker = ImageFilePicker();
  final uploader = Uploader();
  final dialogManager = DialogManager();

  @observable
  String panNumber = "";

  @observable
  File? selectedImage;
}
