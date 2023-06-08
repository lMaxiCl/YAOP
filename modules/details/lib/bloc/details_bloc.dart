import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:models/spaceship_model.dart';
import 'package:network/network_service.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final SpacecraftInfo spacecraftInfo;
  DetailsBloc(this.spacecraftInfo)
      : super(
          DetailsState(spacecraftInfo, false),
        ) {
    on<ToggleFavorites>((event, emit) {
      final state = this.state;
      // TODO: implement event handler
      try {
        GetIt.instance.get<NetworkService>().addToFavorites(spacecraftInfo);

        emit(
          DetailsState(spacecraftInfo, !state.isFavorite),
        );
      } on Exception catch (e) {
        emit(state);
      }
    });
  }
}
