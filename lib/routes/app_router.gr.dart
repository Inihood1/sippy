// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CartInviteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CartInviteScreen(),
      );
    },
    ConfirmationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConfirmationScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    InviteLandingRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<InviteLandingRouteArgs>(
          orElse: () => InviteLandingRouteArgs(
              sessionId: pathParams.getString('sessionId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: InviteLandingScreen(
          sessionId: args.sessionId,
          key: args.key,
        ),
      );
    },
    ProductListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductListScreen(),
      );
    },
    SharedCartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SharedCartScreen(),
      );
    },
  };
}

/// generated route for
/// [CartInviteScreen]
class CartInviteRoute extends PageRouteInfo<void> {
  const CartInviteRoute({List<PageRouteInfo>? children})
      : super(
          CartInviteRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartInviteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfirmationScreen]
class ConfirmationRoute extends PageRouteInfo<void> {
  const ConfirmationRoute({List<PageRouteInfo>? children})
      : super(
          ConfirmationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InviteLandingScreen]
class InviteLandingRoute extends PageRouteInfo<InviteLandingRouteArgs> {
  InviteLandingRoute({
    required String sessionId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          InviteLandingRoute.name,
          args: InviteLandingRouteArgs(
            sessionId: sessionId,
            key: key,
          ),
          rawPathParams: {'sessionId': sessionId},
          initialChildren: children,
        );

  static const String name = 'InviteLandingRoute';

  static const PageInfo<InviteLandingRouteArgs> page =
      PageInfo<InviteLandingRouteArgs>(name);
}

class InviteLandingRouteArgs {
  const InviteLandingRouteArgs({
    required this.sessionId,
    this.key,
  });

  final String sessionId;

  final Key? key;

  @override
  String toString() {
    return 'InviteLandingRouteArgs{sessionId: $sessionId, key: $key}';
  }
}

/// generated route for
/// [ProductListScreen]
class ProductListRoute extends PageRouteInfo<void> {
  const ProductListRoute({List<PageRouteInfo>? children})
      : super(
          ProductListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SharedCartScreen]
class SharedCartRoute extends PageRouteInfo<void> {
  const SharedCartRoute({List<PageRouteInfo>? children})
      : super(
          SharedCartRoute.name,
          initialChildren: children,
        );

  static const String name = 'SharedCartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
