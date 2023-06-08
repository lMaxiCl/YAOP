import 'dart:async';

import 'package:dio/dio.dart';
import 'package:models/spaceship_model.dart';
import 'package:network/space_ship_network_client.dart';

class NetworkService {
  late final SpaceShipNetworkClient _spaceShipNetworkClient;

  NetworkService() {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['limit'] = '';
    _spaceShipNetworkClient = SpaceShipNetworkClient(dio);
  }

  Future<void> addToFavorites(SpacecraftInfo spacecraftInfo) async {
    try {
      //Implement addToFavorites
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFromFavorites(SpacecraftInfo spacecraftInfo) async {
    try {
      //Implement removeFromFavorites
    } catch (e) {
      rethrow;
    }
  }

  Future<StarShipListMetadata> getSpaceshipList({page = 1}) async {
    try {
      return await _spaceShipNetworkClient.getSpaceShips(page);
    } catch (e) {
      rethrow;
    }
  }
}
