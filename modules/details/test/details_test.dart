import 'package:details/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:models/spaceship_model.dart';

void main() {
  testDetailsPage();
}

void testDetailsPage() {
  final fakeValidSpacecraftInfo = SpacecraftInfo(
      name: "test",
      model: "testModel",
      manufacturer: "",
      costInCredits: "",
      length: "",
      maxAtmospheringSpeed: "",
      crew: "",
      passengers: "",
      cargoCapacity: "",
      consumables: "",
      hyperdriveRating: "",
      mglt: "",
      starshipClass: "",
      url: "https://picsum.photos/200");

  testWidgets("Details displaying all requiredInfo", (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: DetailsPageRoot(fakeValidSpacecraftInfo),
      ),
    );
    expect(find.text("Name: ${fakeValidSpacecraftInfo.name}"), findsOneWidget);
    expect(
        find.text("Model: ${fakeValidSpacecraftInfo.model}"), findsOneWidget);
    expect(find.text("Manufacturer: ${fakeValidSpacecraftInfo.manufacturer}"),
        findsOneWidget);
    expect(
        find.text("Cost in credits: ${fakeValidSpacecraftInfo.costInCredits}"),
        findsOneWidget);
    expect(
        find.text("Length: ${fakeValidSpacecraftInfo.length}"), findsOneWidget);
    expect(
        find.text(
            "Max atmosphering speed: ${fakeValidSpacecraftInfo.maxAtmospheringSpeed}"),
        findsOneWidget);
    expect(find.text("Crew: ${fakeValidSpacecraftInfo.crew}"), findsOneWidget);
    expect(find.text("Passengers: ${fakeValidSpacecraftInfo.passengers}"),
        findsOneWidget);
    expect(
        find.text("Cargo capacity: ${fakeValidSpacecraftInfo.cargoCapacity}"),
        findsOneWidget);
    expect(find.text("Consumables: ${fakeValidSpacecraftInfo.consumables}"),
        findsOneWidget);
    expect(
        find.text(
            "Hyperdrive rating: ${fakeValidSpacecraftInfo.hyperdriveRating}"),
        findsOneWidget);
    expect(find.text("MGLT: ${fakeValidSpacecraftInfo.mglt}"), findsOneWidget);
    expect(
        find.text("Starship class: ${fakeValidSpacecraftInfo.starshipClass}"),
        findsOneWidget);
  });
}
