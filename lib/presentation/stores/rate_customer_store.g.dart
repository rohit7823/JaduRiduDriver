// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_customer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RateCustomerStore on IRateCustomerStore, Store {
  late final _$customerReviewAtom =
      Atom(name: 'IRateCustomerStore.customerReview', context: context);

  @override
  String get customerReview {
    _$customerReviewAtom.reportRead();
    return super.customerReview;
  }

  @override
  set customerReview(String value) {
    _$customerReviewAtom.reportWrite(value, super.customerReview, () {
      super.customerReview = value;
    });
  }

  late final _$customerRatingAtom =
      Atom(name: 'IRateCustomerStore.customerRating', context: context);

  @override
  double get customerRating {
    _$customerRatingAtom.reportRead();
    return super.customerRating;
  }

  @override
  set customerRating(double value) {
    _$customerRatingAtom.reportWrite(value, super.customerRating, () {
      super.customerRating = value;
    });
  }

  late final _$enableBtnAtom =
      Atom(name: 'IRateCustomerStore.enableBtn', context: context);

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

  late final _$uploadingReviewLoaderAtom =
      Atom(name: 'IRateCustomerStore.uploadingReviewLoader', context: context);

  @override
  bool get uploadingReviewLoader {
    _$uploadingReviewLoaderAtom.reportRead();
    return super.uploadingReviewLoader;
  }

  @override
  set uploadingReviewLoader(bool value) {
    _$uploadingReviewLoaderAtom.reportWrite(value, super.uploadingReviewLoader,
        () {
      super.uploadingReviewLoader = value;
    });
  }

  late final _$_validateInputsAsyncAction =
      AsyncAction('IRateCustomerStore._validateInputs', context: context);

  @override
  Future _validateInputs() {
    return _$_validateInputsAsyncAction.run(() => super._validateInputs());
  }

  late final _$submitReviewAsyncAction =
      AsyncAction('IRateCustomerStore.submitReview', context: context);

  @override
  Future submitReview() {
    return _$submitReviewAsyncAction.run(() => super.submitReview());
  }

  late final _$IRateCustomerStoreActionController =
      ActionController(name: 'IRateCustomerStore', context: context);

  @override
  dynamic onCustomerReview(String review) {
    final _$actionInfo = _$IRateCustomerStoreActionController.startAction(
        name: 'IRateCustomerStore.onCustomerReview');
    try {
      return super.onCustomerReview(review);
    } finally {
      _$IRateCustomerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onCustomerRating(double rating) {
    final _$actionInfo = _$IRateCustomerStoreActionController.startAction(
        name: 'IRateCustomerStore.onCustomerRating');
    try {
      return super.onCustomerRating(rating);
    } finally {
      _$IRateCustomerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customerReview: ${customerReview},
customerRating: ${customerRating},
enableBtn: ${enableBtn},
uploadingReviewLoader: ${uploadingReviewLoader}
    ''';
  }
}
