import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home_page/bloc/home_page_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.atEdge && controller.position.pixels != 0) {
        context.read<HomePageBloc>().add(
              LoadMore(),
            );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomePageLoading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case HomePageLoaded:
              return ListView.builder(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                itemCount: (state as HomePageLoaded).spaceCrafts.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(state.spaceCrafts[index].name!),
                          onTap: () => context.push(
                            '/${state.spaceCrafts[index].name}',
                            extra: state.spaceCrafts[index],
                          ),
                        ),
                        if (!state.hasReachedMax &&
                            index == state.spaceCrafts.length - 1)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                      ],
                    ),
                  );
                },
              );
            case HomePageError:
              return Center(
                child: Text(
                  (state as HomePageError).message,
                ),
              );
          }
          return Container();
        },
      ),
    );
  }
}
