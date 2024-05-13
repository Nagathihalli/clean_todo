import 'package:clean_todo_app/data/data.dart';
import 'package:clean_todo_app/providers/task/task_notifier.dart';
import 'package:clean_todo_app/providers/task/task_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository  = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});