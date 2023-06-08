import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/spaceship_model.dart';
import 'package:network/network_service.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final NetworkService _networkService;
  HomePageBloc(this._networkService) : super(HomePageLoading()) {
    on<LoadData>(
      (event, emit) async {
        emit(HomePageLoading());
        try {
          await _networkService.getSpaceshipList().then(
                (value) => emit(
                  HomePageLoaded(
                    value.results,
                    hasReachedMax: value.next == null,
                  ),
                ),
              );
        } catch (e) {
          emit(
            HomePageError(
              e.toString(),
            ),
          );
        }
      },
    );
    on<LoadMore>(
      (event, emit) async {
        try {
          final state = this.state;
          if (state is HomePageLoaded && !state.hasReachedMax) {
            await _networkService
                .getSpaceshipList(
                  page: state.page + 1,
                )
                .then(
                  (value) => emit(
                    HomePageLoaded(
                      state.spaceCrafts + value.results,
                      page: state.page + 1,
                      hasReachedMax: value.next == null,
                    ),
                  ),
                );
          }
        } catch (e) {
          emit(
            HomePageError(
              e.toString(),
            ),
          );
        }
      },
    );
  }
}
