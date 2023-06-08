import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/details_bloc.dart';

class DetailsPageScaffold extends StatelessWidget {
  const DetailsPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.spacecraftInfo.name!),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Name: ${state.spacecraftInfo.name}"),
                Text("Model: ${state.spacecraftInfo.model}"),
                Text("Manufacturer: ${state.spacecraftInfo.manufacturer}"),
                Text("Cost in credits: ${state.spacecraftInfo.costInCredits}"),
                Text("Length: ${state.spacecraftInfo.length}"),
                Text(
                    "Max atmosphering speed: ${state.spacecraftInfo.maxAtmospheringSpeed}"),
                Text("Crew: ${state.spacecraftInfo.crew}"),
                Text("Passengers: ${state.spacecraftInfo.passengers}"),
                Text("Cargo capacity: ${state.spacecraftInfo.cargoCapacity}"),
                Text("Consumables: ${state.spacecraftInfo.consumables}"),
                Text(
                    "Hyperdrive rating: ${state.spacecraftInfo.hyperdriveRating}"),
                Text("MGLT: ${state.spacecraftInfo.mglt}"),
                Text("Starship class: ${state.spacecraftInfo.starshipClass}"),
                IconButton(
                  onPressed: () => context.read<DetailsBloc>().add(
                        ToggleFavorites(),
                      ),
                  icon: Icon(state.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
