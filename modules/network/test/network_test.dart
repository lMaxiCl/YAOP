import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:models/spaceship_model.dart';
import 'package:network/network_service.dart';
import 'package:network/space_ship_network_client.dart';

import 'network_test.mocks.dart';

void main() {
  testNetworkService();
  testSpaceShipNetworkClient();
}

void testNetworkService() {
  //NetworkService test
  test(
      'NetworkService getSpaceshipList returns data when SpaceShipNetworkClient returns data',
      () async {
    final networkService = MockNetworkService();
    when(networkService.getSpaceshipList(page: 1)).thenAnswer(
      (_) async => Future.value(
        StarShipListMetadata(count: 1, results: [], next: '', previous: ''),
      ),
    );
    final result = await networkService.getSpaceshipList(page: 1);
    expect(result.count, 1);
  });

  test(
      'NetworkService getSpaceshipList throws exception when SpaceShipNetworkClient throws exception',
      () async {
    final networkService = MockNetworkService();
    when(networkService.getSpaceshipList(page: 1)).thenThrow(Exception());
    expect(
      () async => await networkService.getSpaceshipList(page: 1),
      throwsException,
    );
  });
}

class MockNetworkService extends Mock implements NetworkService {
  @override
  late final SpaceShipNetworkClient _spaceShipNetworkClient;

  MockNetworkService() {
    _spaceShipNetworkClient = MockSpaceShipNetworkClient();
  }

  Future<void> addToFavorites(SpacecraftInfo spacecraftInfo) async {
    try {} catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeFromFavorites(SpacecraftInfo spacecraftInfo) async {
    try {} catch (e) {
      rethrow;
    }
  }

  @override
  Future<StarShipListMetadata> getSpaceshipList({page = 1}) async {
    return await _spaceShipNetworkClient.getSpaceShips(page);
  }
}

@GenerateMocks([SpaceShipNetworkClient])
void testSpaceShipNetworkClient() {
  late SpaceShipNetworkClient spaceShipNetworkClient;
  setUp(() {
    spaceShipNetworkClient = MockSpaceShipNetworkClient();
  });

  test('getSpaceShips returns data', () async {
    when(spaceShipNetworkClient.getSpaceShips(1)).thenAnswer(
      (_) async => Future.value(
        StarShipListMetadata(count: 1, results: [], next: '', previous: ''),
      ),
    );
    final result = await spaceShipNetworkClient.getSpaceShips(1);
    expect(result.count, 1);
  });

  test('Error rethrown when catched', () {
    when(spaceShipNetworkClient.getSpaceShips(1)).thenThrow(Exception());
    expect(
      () async => await spaceShipNetworkClient.getSpaceShips(1),
      throwsException,
    );
  });

  test('getShips returns Data', () {
    final spaceShipNetworkClient = MockSpaceShipNetworkClient();
    when(spaceShipNetworkClient.getSpaceShips(1)).thenAnswer(
      (_) async => Future.value(
        StarShipListMetadata(count: 1, results: [], next: '', previous: ''),
      ),
    );
    final result = spaceShipNetworkClient.getSpaceShips(1);
    expect(result, isA<Future<StarShipListMetadata>>());
  });

  test('Error rethrown when catched', () {
    final spaceShipNetworkClient = MockSpaceShipNetworkClient();
    when(spaceShipNetworkClient.getSpaceShips(1)).thenThrow(Exception());
    expect(
      () async => await spaceShipNetworkClient.getSpaceShips(1),
      throwsException,
    );
  });
}

class FakeSpacecraftInfo extends Fake implements SpacecraftInfo {}
