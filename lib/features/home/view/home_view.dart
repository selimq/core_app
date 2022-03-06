import 'package:core_app/core/components/text/locale_text.dart';
import 'package:core_app/core/init/language/language_manager.dart';
import 'package:core_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
          if (state.error != null) {
            // TODO your code here
          }
        },
        builder: (BuildContext context, HomeState state) {
          if (state.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return buildBody(state);
        },
      ),
    );
  }

  Widget buildBody(HomeState state) {
    return ListView(
      children: [
        LocaleText(value: LocaleKeys.welcome),
        Text(context.locale.toString()),
        TextButton(
          child: Text("Change lang"),
          onPressed: () {
            LanguageManager.instance.changeLanguage(context);
          },
        )
      ],
    );
  }
}
