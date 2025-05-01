import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/cart/shared_cart_screen.dart';
import '../screens/confirmation/confirmation_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/invite/cart_invite_screen.dart';
import '../screens/landing/invite_landing_screen.dart';
import '../screens/products/product_list_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(
    replaceInRouteName: 'Screen,Route'
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: CartInviteRoute.page, path: '/invite'),
    AutoRoute(page: InviteLandingRoute.page, path: '/session/:sessionId'),
    AutoRoute(page: ProductListRoute.page, path: '/products'),
    AutoRoute(page: SharedCartRoute.page, path: '/cart'),
    AutoRoute(page: ConfirmationRoute.page, path: '/confirmation'),
  ];
}
