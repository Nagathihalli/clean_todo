import 'package:clean_todo_app/config/routes/routes.dart';
import 'package:clean_todo_app/data/models/task.dart';
import 'package:clean_todo_app/providers/providers.dart';
import 'package:clean_todo_app/utils/utils.dart';
import 'package:clean_todo_app/widgets/categories_selection.dart';
import 'package:clean_todo_app/widgets/common_text_field.dart';
import 'package:clean_todo_app/widgets/display_white_text.dart';
import 'package:clean_todo_app/widgets/select_date_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddNewTodo extends ConsumerStatefulWidget {
  static AddNewTodo builder(BuildContext context, GoRouterState state) =>
      const AddNewTodo();

  const AddNewTodo({super.key});

  @override
  ConsumerState<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends ConsumerState<AddNewTodo> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: DisplayWhiteText(text: 'Add New Task'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommonTextField(
                hintText: 'Task Title',
                title: 'Task Title',
                controller: titleController),
            Gap(30),
            CategoriesSelection(),
            Gap(30),
            SelectDateTime(),
            Gap(30),
            CommonTextField(
              hintText: 'Note',
              title: 'Note',
              controller: noteController,
              maxLines: 6,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Save'))
          ],
        ),
      )),
    );
  }

  void _addNewTodo() async {
    final title = titleController.text.trim();
    final note = noteController.text.trim();
    final time = ref.watch(timeProvider);
    final date = ref.watch(dateProvider);
    final category = ref.watch(categoryProvider);
    if (title.isNotEmpty) {
      final task = Task(
          title: title,
          category: category,
          time: Helpers.timeToString(time),
          date: Helpers.dateFormatter(date),
          note: note,
          isCompleted: false);
      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        AppAlerts.displaySnackBar(context, 'Task Create Successfully');
        context.go(RouteLocation.home);
      });
    } else {
      AppAlerts.displaySnackBar(context, "Title cannot be empty");
    }
  }
}
