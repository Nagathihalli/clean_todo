import 'package:clean_todo_app/data/models/task.dart';
import 'package:clean_todo_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/providers.dart';

@immutable
class AppAlerts {
  const AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message, style: context.textTheme.bodyMedium),
        backgroundColor: context.colorScheme.onSecondary));
  }

  static Future<void> showAlertDeleteDialogue(
      {required BuildContext context,
      required WidgetRef ref,
      required Task task}) async {
    Widget cancelButton =
        TextButton(onPressed: () => context.pop(), child: const Text("No"));
    Widget deleteButton = TextButton(
        onPressed: () async {
          await ref.read(taskProvider.notifier).deleteTask(task).then((value)  {
            displaySnackBar(context, 'Task deleted successfully');
            context.pop();
          });
        },
        child: const Text("yes"));

    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure you want to delete this task?'),
      actions: [cancelButton, deleteButton],
    );

    await showDialog(context: context, builder: (BuildContext context) {
      return alert;
    });
  }
}
