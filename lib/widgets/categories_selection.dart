import 'package:clean_todo_app/providers/category_provider.dart';
import 'package:clean_todo_app/utils/task_category.dart';
import 'package:clean_todo_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'circle_container.dart';

class CategoriesSelection extends ConsumerWidget {
  CategoriesSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final List<TaskCategory> catogories = TaskCategory.values.toList();
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text("Category", style: context.textTheme.titleLarge),
          const Gap(10),
          Expanded(
              child: ListView.separated(
            itemCount: catogories.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              final category = catogories[index];
              return InkWell(
                onTap: () {
                  ref.read(categoryProvider.notifier).state = category;
                },
                borderRadius: BorderRadius.circular(30),
                child: CircleContainer(
                  color: category.color.withOpacity(0.3),
                  borderColor: category.color,
                  child: Icon(
                    category.icon,
                    color: selectedCategory == category
                        ? context.colorScheme.primary
                        : category.color.withOpacity(0.5),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Gap(8),
          ))
        ],
      ),
    );
  }
}
