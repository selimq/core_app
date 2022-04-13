import 'package:core_app/core/constants/enums/http_request_enum.dart';
import 'package:core_app/core/init/network/model/response_model.dart';
import 'package:core_app/core/init/network/network_manager.dart';
import 'package:core_app/features/home/model/coffee_model.dart';
import 'package:core_app/product/constant/application_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  GlobalKey scaffoldKey = GlobalKey();
  HomeViewModel() {
    getItems();
  }
  bool isLoading = true;
  setLoading(bool loading) async {
    isLoading = loading;
    notifyListeners();
  }

  List<Coffee> list = [];
  Future<void> getItems() async {
    setLoading(true);
    try {
      final response = await NetworkManager.instance.coreDio.myFetch(
          ApplicationConstant.instance.baseUrl + '/hot',
          type: HttpTypes.GET,
          parseModel: Coffee());
      if (response.data != null) {
        list = response.data;
      }
    } catch (e) {
      if (kDebugMode) {
        const snackBar = SnackBar(
          content: Text("Error"),
          duration: Duration(seconds: 2),
        );
        print(e);
        list = [];
        ScaffoldMessenger.of(scaffoldKey.currentContext!)
            .showSnackBar(snackBar);
      }
    }
    setLoading(false);
    notifyListeners();
  }
}
