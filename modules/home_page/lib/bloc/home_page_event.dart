part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class LoadData extends HomePageEvent {
  @override
  List<Object> get props => [];
}

class LoadMore extends HomePageEvent {
  @override
  List<Object> get props => [];
}
