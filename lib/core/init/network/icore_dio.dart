import 'package:core_app/core/init/network/model/IResponseModel.dart';
import 'package:dio/dio.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> myFetch<R, T extends IBaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}
// MARK: Null SAfety

abstract class ICoreDioNullSafety {
  Future<IResponseModel<R>> myFetch<R, T extends IBaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}

abstract class ICoreDioFull extends ICoreDio {
  Future<IResponseModel<R>> myFetchNoNetwork<R, T extends IBaseModel>(
      String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}

// MARK: Nul SAfety
abstract class ICoreDioFullNulSafetyFull extends ICoreDioNullSafety {
  Future<IResponseModel<R>> myFetchNoNetwork<R, T extends IBaseModel>(
      String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}
