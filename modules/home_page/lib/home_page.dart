library home_page;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:home_page/bloc/home_page_bloc.dart';
import 'package:home_page/ui/home_page.dart';
import 'package:network/network_service.dart';

class HomePageRoot extends StatelessWidget {
  const HomePageRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //wrapper for bloc's, translations, and other stuff that depends on page's context
    return BlocProvider(
      create: (context) =>
          HomePageBloc(GetIt.instance.get<NetworkService>())..add(LoadData()),
      child: HomePage(),
    );
  }
}
