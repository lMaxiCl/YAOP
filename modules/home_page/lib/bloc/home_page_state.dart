part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();
}

class HomePageLoading extends HomePageState {
  @override
  List<Object> get props => [];
}

class HomePageLoaded extends HomePageState {
  final List<SpacecraftInfo> spaceCrafts;
  final int page;
  final bool hasReachedMax;

  HomePageLoaded(this.spaceCrafts, {this.page = 1, this.hasReachedMax = false});

  @override
  List<Object> get props => [spaceCrafts, page, hasReachedMax];
}

class HomePageError extends HomePageState {
  final String message;

  HomePageError(this.message);

  @override
  List<Object> get props => [message];
}
