import 'package:clean_todo_app/data/datasource/datasource.dart';
import 'package:clean_todo_app/data/repositories/task_repository.dart';
import 'package:clean_todo_app/data/repositories/task_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final dataSource = ref.read(taskDatasourceProvider);
  return TaskRepositoryImpl(dataSource);
});
