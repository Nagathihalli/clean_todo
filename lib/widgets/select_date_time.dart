import 'package:clean_todo_app/providers/providers.dart';
import 'package:clean_todo_app/utils/helpers.dart';
import 'package:clean_todo_app/widgets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeProvider);
    final date = ref.watch(dateProvider);
    return Row(
      children: [
        Expanded(
            child: CommonTextField(
          hintText: Helpers.dateFormatter(date),
          title: 'Date',
          readOnly: true,
          suffixIcon: IconButton(
              onPressed: () => Helpers.selectDate(context, ref),
              icon: const FaIcon(FontAwesomeIcons.calendar)),
        )),
        const Gap(10),
        Expanded(
            child: CommonTextField(
          title: 'Time',
          hintText: Helpers.timeToString(time),
          readOnly: true,
          suffixIcon: IconButton(
              onPressed: () => Helpers.timeToString(time),
              icon: const FaIcon(FontAwesomeIcons.clock)),
        ))
      ],
    );
  }

  void selectTime(BuildContext context, WidgetRef ref) async {
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }
}
