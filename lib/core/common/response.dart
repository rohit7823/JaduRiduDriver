abstract class Resource<T> {
  T? data;
  String? message;
}

class Success<T> extends Resource<T> {
  @override
  covariant T? data;

  @override
  String? message;

  Success(this.data);
}

class Error<T> extends Resource<T> {
  @override
  covariant var data;

  @override
  String? message;

  Error({this.data, required this.message});
}
