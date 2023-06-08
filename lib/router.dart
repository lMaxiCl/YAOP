import 'package:details/details.dart';
import 'package:go_router/go_router.dart';
import 'package:home_page/home_page.dart';

GoRouter router() => GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomePageRoot(),
        ),
        GoRoute(
          path: '/:itemId',
          builder: (context, state) => DetailsPageRoot(state.extra),
        ),
      ],
    );
