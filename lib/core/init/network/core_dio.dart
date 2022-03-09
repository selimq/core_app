import 'dart:io';
import 'package:core_app/core/base/model/base_error.dart';
import 'package:core_app/core/init/network/model/IResponseModel.dart';
import 'package:core_app/product/constant/application_constant.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import '../../extension/network_extension.dart';
import 'icore_dio.dart';
import 'model/response_model.dart';
part './network_core/network_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDioNullSafety {
  final BaseOptions options;
  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }
  @override
  Future<IResponseModel<R>> myFetch<R, T extends IBaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onReceiveProgress}) async {
    final response = await request(path,
        data: data, options: Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError('message'));
    }
  }

//!

/* BaseError(message: response.statusMessage ?? "Message"9) */

}
