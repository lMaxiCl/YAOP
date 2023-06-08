// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spaceship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarShipListMetadata _$StarShipListMetadataFromJson(
        Map<String, dynamic> json) =>
    StarShipListMetadata(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => SpacecraftInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StarShipListMetadataToJson(
        StarShipListMetadata instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

SpacecraftInfo _$SpacecraftInfoFromJson(Map<String, dynamic> json) =>
    SpacecraftInfo(
      name: json['name'] as String?,
      model: json['model'] as String?,
      manufacturer: json['manufacturer'] as String?,
      costInCredits: json['cost_in_credits'] as String?,
      length: json['length'] as String?,
      maxAtmospheringSpeed: json['max_atmosphering_speed'] as String?,
      crew: json['crew'] as String?,
      passengers: json['passengers'] as String?,
      cargoCapacity: json['cargo_capacity'] as String?,
      consumables: json['consumables'] as String?,
      hyperdriveRating: json['hyperdrive_rating'] as String?,
      mglt: json['MGLT'] as String?,
      starshipClass: json['starship_class'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SpacecraftInfoToJson(SpacecraftInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'model': instance.model,
      'manufacturer': instance.manufacturer,
      'cost_in_credits': instance.costInCredits,
      'length': instance.length,
      'max_atmosphering_speed': instance.maxAtmospheringSpeed,
      'crew': instance.crew,
      'passengers': instance.passengers,
      'cargo_capacity': instance.cargoCapacity,
      'consumables': instance.consumables,
      'hyperdrive_rating': instance.hyperdriveRating,
      'MGLT': instance.mglt,
      'starship_class': instance.starshipClass,
      'url': instance.url,
    };
