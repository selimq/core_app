import 'package:core_app/core/init/network/network_manager.dart';

class LoginService {
  static LoginService? _instace;
  static LoginService get instance {
    _instace ??= LoginService._init();
    return _instace!;
  }

  LoginService._init();

  Future<Map<String, String>> login() async {
    print("login...");
    await Future.delayed(const Duration(seconds: 2));
    // NetworkManager.instance.coreDio.myFetch("", type: type, parseModel: parseModel)
    print("login finished");
    return {"name": "Ali"};
  }
}
