library details;

import 'package:details/ui/details_page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/spaceship_model.dart';

import 'bloc/details_bloc.dart';

class DetailsPageRoot extends StatelessWidget {
  late final SpacecraftInfo spacecraftInfo;

  DetailsPageRoot(Object? spacecraftInfo, {Key? key}) : super(key: key) {
    this.spacecraftInfo = spacecraftInfo as SpacecraftInfo;
  }

  @override
  Widget build(BuildContext context) {
    //wrapper for bloc's, translations, and other stuff that depends on page's context(for consistency only)
    return BlocProvider(
      create: (context) => DetailsBloc(spacecraftInfo),
      child: const DetailsPageScaffold(),
    );
  }
}
