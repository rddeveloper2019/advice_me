import 'package:auto_route/auto_route.dart';
import 'package:advice_me/features/features.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      children: [
        AutoRoute(page: SearchRoute.page, path: 'search'),
        AutoRoute(page: FavoritesRoute.page, path: 'favorites'),
        AutoRoute(page: HistoryRoute.page, path: 'history'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
      ],
    ),
  ];
}
