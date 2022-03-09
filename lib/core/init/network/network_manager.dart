import 'package:core_app/product/constant/application_constant.dart';
import 'package:dio/dio.dart';

import 'core_dio.dart';
import 'icore_dio.dart';

class NetworkManager {
  static NetworkManager? _instace;
  static NetworkManager get instance {
    _instace ??= NetworkManager._init();
    return _instace!;
  }

  late ICoreDioNullSafety coreDio;

  NetworkManager._init() {
    final baseOptions =
        BaseOptions(baseUrl: ApplicationConstant.instance.baseUrl, headers: {});
    coreDio = CoreDio(baseOptions);
  }
}
