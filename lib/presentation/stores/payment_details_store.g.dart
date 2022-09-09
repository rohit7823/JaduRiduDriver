// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentDetailStore on _PaymentDetailsStore, Store {
  late final _$enableBtnAtom =
      Atom(name: '_PaymentDetailsStore.enableBtn', context: context);

  @override
  bool get enableBtn {
    _$enableBtnAtom.reportRead();
    return super.enableBtn;
  }

  @override
  set enableBtn(bool value) {
    _$enableBtnAtom.reportWrite(value, super.enableBtn, () {
      super.enableBtn = value;
    });
  }

  late final _$selectedImageAtom =
      Atom(name: '_PaymentDetailsStore.selectedImage', context: context);

  @override
  File? get selectedImage {
    _$selectedImageAtom.reportRead();
    return super.selectedImage;
  }

  @override
  set selectedImage(File? value) {
    _$selectedImageAtom.reportWrite(value, super.selectedImage, () {
      super.selectedImage = value;
    });
  }

  late final _$upisAtom =
      Atom(name: '_PaymentDetailsStore.upis', context: context);

  @override
  List<UpiID> get upis {
    _$upisAtom.reportRead();
    return super.upis;
  }

  @override
  set upis(List<UpiID> value) {
    _$upisAtom.reportWrite(value, super.upis, () {
      super.upis = value;
    });
  }

  late final _$selectedUpiAtom =
      Atom(name: '_PaymentDetailsStore.selectedUpi', context: context);

  @override
  UpiID? get selectedUpi {
    _$selectedUpiAtom.reportRead();
    return super.selectedUpi;
  }

  @override
  set selectedUpi(UpiID? value) {
    _$selectedUpiAtom.reportWrite(value, super.selectedUpi, () {
      super.selectedUpi = value;
    });
  }

  late final _$gettingUpisLoaderAtom =
      Atom(name: '_PaymentDetailsStore.gettingUpisLoader', context: context);

  @override
  bool get gettingUpisLoader {
    _$gettingUpisLoaderAtom.reportRead();
    return super.gettingUpisLoader;
  }

  @override
  set gettingUpisLoader(bool value) {
    _$gettingUpisLoaderAtom.reportWrite(value, super.gettingUpisLoader, () {
      super.gettingUpisLoader = value;
    });
  }

  late final _$upiIDAtom =
      Atom(name: '_PaymentDetailsStore.upiID', context: context);

  @override
  String get upiID {
    _$upiIDAtom.reportRead();
    return super.upiID;
  }

  @override
  set upiID(String value) {
    _$upiIDAtom.reportWrite(value, super.upiID, () {
      super.upiID = value;
    });
  }

  late final _$upiStatusLabelAtom =
      Atom(name: '_PaymentDetailsStore.upiStatusLabel', context: context);

  @override
  String get upiStatusLabel {
    _$upiStatusLabelAtom.reportRead();
    return super.upiStatusLabel;
  }

  @override
  set upiStatusLabel(String value) {
    _$upiStatusLabelAtom.reportWrite(value, super.upiStatusLabel, () {
      super.upiStatusLabel = value;
    });
  }

  late final _$informMessageAtom =
      Atom(name: '_PaymentDetailsStore.informMessage', context: context);

  @override
  String get informMessage {
    _$informMessageAtom.reportRead();
    return super.informMessage;
  }

  @override
  set informMessage(String value) {
    _$informMessageAtom.reportWrite(value, super.informMessage, () {
      super.informMessage = value;
    });
  }

  late final _$uploadingLoaderAtom =
      Atom(name: '_PaymentDetailsStore.uploadingLoader', context: context);

  @override
  bool get uploadingLoader {
    _$uploadingLoaderAtom.reportRead();
    return super.uploadingLoader;
  }

  @override
  set uploadingLoader(bool value) {
    _$uploadingLoaderAtom.reportWrite(value, super.uploadingLoader, () {
      super.uploadingLoader = value;
    });
  }

  late final _$fromGalleryAsyncAction =
      AsyncAction('_PaymentDetailsStore.fromGallery', context: context);

  @override
  Future fromGallery() {
    return _$fromGalleryAsyncAction.run(() => super.fromGallery());
  }

  late final _$fromCameraAsyncAction =
      AsyncAction('_PaymentDetailsStore.fromCamera', context: context);

  @override
  Future fromCamera() {
    return _$fromCameraAsyncAction.run(() => super.fromCamera());
  }

  late final _$onUpiIdAsyncAction =
      AsyncAction('_PaymentDetailsStore.onUpiId', context: context);

  @override
  Future onUpiId(String id) {
    return _$onUpiIdAsyncAction.run(() => super.onUpiId(id));
  }

  late final _$_validateInputsAsyncAction =
      AsyncAction('_PaymentDetailsStore._validateInputs', context: context);

  @override
  Future _validateInputs() {
    return _$_validateInputsAsyncAction.run(() => super._validateInputs());
  }

  late final _$getInitialDataAsyncAction =
      AsyncAction('_PaymentDetailsStore.getInitialData', context: context);

  @override
  Future getInitialData() {
    return _$getInitialDataAsyncAction.run(() => super.getInitialData());
  }

  late final _$onDoneAsyncAction =
      AsyncAction('_PaymentDetailsStore.onDone', context: context);

  @override
  Future onDone() {
    return _$onDoneAsyncAction.run(() => super.onDone());
  }

  late final _$_PaymentDetailsStoreActionController =
      ActionController(name: '_PaymentDetailsStore', context: context);

  @override
  dynamic clearSelectedImage() {
    final _$actionInfo = _$_PaymentDetailsStoreActionController.startAction(
        name: '_PaymentDetailsStore.clearSelectedImage');
    try {
      return super.clearSelectedImage();
    } finally {
      _$_PaymentDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectUpi(UpiID? upiID) {
    final _$actionInfo = _$_PaymentDetailsStoreActionController.startAction(
        name: '_PaymentDetailsStore.onSelectUpi');
    try {
      return super.onSelectUpi(upiID);
    } finally {
      _$_PaymentDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enableBtn: ${enableBtn},
selectedImage: ${selectedImage},
upis: ${upis},
selectedUpi: ${selectedUpi},
gettingUpisLoader: ${gettingUpisLoader},
upiID: ${upiID},
upiStatusLabel: ${upiStatusLabel},
informMessage: ${informMessage},
uploadingLoader: ${uploadingLoader}
    ''';
  }
}
