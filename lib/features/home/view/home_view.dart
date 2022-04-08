import 'package:core_app/core/components/text/locale_text.dart';
import 'package:core_app/core/constants/enums/http_request_enum.dart';
import 'package:core_app/core/constants/navigation/navigation_constants.dart';
import 'package:core_app/core/init/language/language_manager.dart';
import 'package:core_app/core/init/navigation/navigation_route.dart';
import 'package:core_app/core/init/navigation/navigation_service.dart';
import 'package:core_app/core/init/network/model/IResponseModel.dart';
import 'package:core_app/core/init/network/network_manager.dart';
import 'package:core_app/features/home/model/coffee_model.dart';
import 'package:core_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_app/features/home/cubit/home_cubit.dart';
import 'package:core_app/features/home/cubit/home_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final screenCubit = HomeCubit();

  @override
  void initState() {
    screenCubit.loadInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        bloc: screenCubit,
        listener: (BuildContext context, HomeState state) {
          if (state.error != null) {}
        },
        builder: (BuildContext context, HomeState state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return buildBody(state);
        },
      ),
    );
  }

  Widget buildBody(HomeState state) {
    return ListView(
      children: [
        const LocaleText(value: LocaleKeys.welcome),
        Text(context.locale.toString()),
        TextButton(
          child: const Text("Change lang"),
          onPressed: () {
            LanguageManager.instance.changeLanguage(context);
          },
        ),
        TextButton(
          child: const Text("Test api"),
          onPressed: () async {
            final data = await NetworkManager.instance.coreDio
                .myFetch<List<Coffee>, Coffee>("/hot",
                    type: HttpTypes.GET, parseModel: Coffee());
            if (kDebugMode) {
              if (data.data is List<Coffee>) {
                print(data.data!.map((e) => e.title));
              }
            }
          },
        ),
        TextButton(
            onPressed: () {
              NavigationService.instance
                  .navigateToPage(NavigationConstants.NEXT);
            },
            child: Text("Navigate Page"))
      ],
    );
  }
}
