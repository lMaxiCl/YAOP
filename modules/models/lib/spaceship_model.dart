import 'package:json_annotation/json_annotation.dart';

part 'spaceship_model.g.dart';

@JsonSerializable()
class StarShipListMetadata {
  final int count;
  final String? next;
  final String? previous;
  final List<SpacecraftInfo> results;

  StarShipListMetadata({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory StarShipListMetadata.fromJson(Map<String, dynamic> json) =>
      _$StarShipListMetadataFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SpacecraftInfo {
  final String? name;
  final String? model;
  final String? manufacturer;
  final String? costInCredits;
  final String? length;
  final String? maxAtmospheringSpeed;
  final String? crew;
  final String? passengers;
  final String? cargoCapacity;
  final String? consumables;
  final String? hyperdriveRating;
  @JsonKey(name: 'MGLT')
  final String? mglt;
  final String? starshipClass;
  final String? url;

  SpacecraftInfo({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.crew,
    required this.passengers,
    required this.cargoCapacity,
    required this.consumables,
    required this.hyperdriveRating,
    required this.mglt,
    required this.starshipClass,
    required this.url,
  });

  //fromMap method
  factory SpacecraftInfo.fromJson(Map<String, dynamic> map) {
    return _$SpacecraftInfoFromJson(map);
  }

  //toJson method
  Map<String, dynamic> toJson() => _$SpacecraftInfoToJson(this);
}
