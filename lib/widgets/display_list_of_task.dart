import 'package:clean_todo_app/providers/providers.dart';
import 'package:clean_todo_app/utils/utils.dart';
import 'package:clean_todo_app/widgets/common_container.dart';
import 'package:clean_todo_app/widgets/task_details.dart';
import 'package:clean_todo_app/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/task.dart';

class DisplayListOfTask extends ConsumerWidget {
  const DisplayListOfTask({
    super.key,
    this.isCompletedTask = false,
    required this.task,
  });

  final bool isCompletedTask;
  final List<Task> task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTask ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTaskAlert = isCompletedTask
        ? 'There is no completed task yet'
        : 'There is no task Todo!';
    return CommonContainer(
      height: height,
      child: task.isEmpty
          ? Center(
              child:
                  Text(emptyTaskAlert, style: context.textTheme.headlineSmall))
          : ListView.separated(
              shrinkWrap: true,
              itemCount: task.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final tasks = task[index];
                return InkWell(
                  onLongPress: () async {
                    await AppAlerts.showAlertDeleteDialogue(
                        context: context, ref: ref, task: tasks);
                  },
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return TaskDetails(task: tasks);
                        });
                  },
                  child: TaskTile(
                      task: tasks,
                      onCompleted: (value) async {
                        await ref
                            .read(taskProvider.notifier)
                            .updateTask(tasks)
                            .then((value) {
                          AppAlerts.displaySnackBar(
                              context,
                              tasks.isCompleted
                                  ? "Task InCompleted"
                                  : "Task Completed");
                        });
                      }),
                );
              },
              separatorBuilder: (context, index) =>
                  const Divider(thickness: 1.5),
            ),
    );
  }
}
