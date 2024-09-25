import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/core/app_routes.gr.dart';
import 'package:flutter_template/core/presentation/pages/home/home_page.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
        ),
      ];
}
