part of 'details_bloc.dart';

class DetailsState extends Equatable {
  final SpacecraftInfo spacecraftInfo;
  final bool isFavorite;
  const DetailsState(this.spacecraftInfo, this.isFavorite);

  @override
  List<Object> get props => [spacecraftInfo, isFavorite];
}
