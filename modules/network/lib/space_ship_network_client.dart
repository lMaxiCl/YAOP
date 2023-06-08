import 'package:dio/dio.dart';
import 'package:models/spaceship_model.dart';
import 'package:retrofit/http.dart';

part 'space_ship_network_client.g.dart';

@RestApi(baseUrl: "https://swapi.dev/api/")
abstract class SpaceShipNetworkClient {
  factory SpaceShipNetworkClient(Dio dio, {String baseUrl}) =
      _SpaceShipNetworkClient;

  @GET("starships/?page={page}")
  Future<StarShipListMetadata> getSpaceShips(@Path() int page);
}
