import 'package:clean_todo_app/config/routes/routes.dart';
import 'package:go_router/go_router.dart';

final appRoutes = [
  GoRoute(path: RouteLocation.splashScreen, parentNavigatorKey: navigationKey),
  GoRoute(path: RouteLocation.home, parentNavigatorKey: navigationKey),
  GoRoute(path: RouteLocation.createTask, parentNavigatorKey: navigationKey)
];
