import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:home_page/bloc/home_page_bloc.dart';
import 'package:home_page/home_page.dart';
import 'package:home_page/ui/home_page.dart';
import 'package:mockito/mockito.dart';
import 'package:models/spaceship_model.dart';
import 'package:network/network_service.dart';

void main() {
  testHomePage();
}

void testHomePage() {
  testWidgets('HomePageRoot initialized correctly', (widgetTester) async {
    GetIt.instance.registerSingleton<NetworkService>(
      MockNetworkService(),
    );
    await widgetTester.pumpWidget(
      MaterialApp(
        home: HomePageRoot(),
      ),
    );
    expect(find.byType(BlocProvider<HomePageBloc>), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);
  });

  blocTest(
    'check if loadData interacts with bloc',
    build: () => HomePageBloc(MockNetworkService()),
    act: (bloc) => bloc.add(LoadData()),
    expect: () => [
      isA<HomePageLoading>(),
      isA<HomePageLoaded>(),
    ],
  );
  blocTest(
    'LoadMore works correctly',
    build: () => HomePageBloc(MockNetworkService())..add(LoadData()),
    wait: Duration(milliseconds: 500),
    act: (bloc) => bloc.add(LoadMore()),
    expect: () => [
      isA<HomePageLoading>(),
      isA<HomePageLoaded>(),
      isA<HomePageLoaded>(),
    ],
  );
  blocTest(
    'on error error sent',
    build: () {
      return HomePageBloc(MockBrokenNetworkService());
    },
    act: (bloc) {
      bloc.add(LoadData());
    },
    expect: () {
      return [
        isA<HomePageLoading>(),
        isA<HomePageError>(),
      ];
    },
  );
}

class MockHomePageBloc extends MockBloc<HomePageEvent, HomePageState>
    implements HomePageBloc {}

class MockNetworkService extends Mock implements NetworkService {
  @override
  Future<StarShipListMetadata> getSpaceshipList({page = 1}) {
    return Future.value(
      StarShipListMetadata(
        count: 1,
        next: 'test',
        previous: null,
        results: [
          SpacecraftInfo(
            name: 'test',
            model: 'test',
            manufacturer: 'test',
            costInCredits: 'test',
            length: 'test',
            maxAtmospheringSpeed: 'test',
            crew: 'test',
            passengers: 'test',
            cargoCapacity: 'test',
            consumables: 'test',
            hyperdriveRating: 'test',
            mglt: 'test',
            starshipClass: 'test',
            url: 'test',
          )
        ],
      ),
    );
  }
}

class MockBrokenNetworkService extends Mock implements NetworkService {
  @override
  Future<StarShipListMetadata> getSpaceshipList({page = 1}) {
    return Future.error('test');
  }
}
