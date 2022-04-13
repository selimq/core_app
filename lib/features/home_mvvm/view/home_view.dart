import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.watch<HomeViewModel>().scaffoldKey,
      body: Container(
        child: context.watch<HomeViewModel>().isLoading
            ? const Center(child: CircularProgressIndicator())
            : context.watch<HomeViewModel>().list.isEmpty
                ? const Center(
                    child: Text("Data not exist"),
                  )
                : ListView.builder(
                    itemCount: context.watch<HomeViewModel>().list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          context.watch<HomeViewModel>().list[index].title ??
                              " null",
                        ),
                      );
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<HomeViewModel>().getItems();
      }),
    );
  }
}
