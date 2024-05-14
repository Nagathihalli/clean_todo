import 'package:clean_todo_app/config/routes/routes.dart';
import 'package:clean_todo_app/screens/add_new_todo.dart';
import 'package:clean_todo_app/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRoutes = [
  // GoRoute(path: RouteLocation.splashScreen, parentNavigatorKey: navigationKey),
  GoRoute(
      path: RouteLocation.home,
      parentNavigatorKey: navigationKey,
      builder: HomeScreen.builder),
  GoRoute(
      path: RouteLocation.createTask,
      parentNavigatorKey: navigationKey,
      builder: AddNewTodo.builder)
];
