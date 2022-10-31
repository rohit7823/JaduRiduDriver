import 'package:mobx/mobx.dart';

part 'distinct_data.g.dart';

class DistinctData<T> = _IDistinctData with _$DistinctData;

abstract class _IDistinctData<T> with Store {
  @observable
  T? data;

  T? _cachedData;

  @action
  init(T data, {required bool Function(T cached, T newly) test}) {
    if (_cachedData == null) {
      this.data = data;
      _cachedData = data;
    } else if (test.call(_cachedData as T, data)) {
      this.data = data;
      _cachedData = data;
    }
  }

  @action
  clear() {
    data = null;
  }

  clearCache() {
    _cachedData = null;
  }
}
