import 'package:clean_todo_app/config/routes/app_routes.dart';
import 'package:clean_todo_app/config/routes/routes_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final navigationKey = GlobalKey<NavigatorState>();

final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      routes: appRoutes,
      navigatorKey: navigationKey,
      initialLocation: RouteLocation.home);
});
