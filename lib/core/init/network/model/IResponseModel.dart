abstract class IResponseModel<T> {
  T? data;
  IErrorModel? errorModel;
}

abstract class IErrorModel {
  void statusCode() {}
}
