part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();
}

class ToggleFavorites extends DetailsEvent {
  @override
  List<Object> get props => [];
}
