import 'package:clean_todo_app/utils/utils.dart';
import 'package:clean_todo_app/widgets/common_container.dart';
import 'package:flutter/material.dart';

class DisplayErrorMsg extends StatelessWidget {
  const DisplayErrorMsg({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    return CommonContainer(
      width: deviceSize.width,
      height: deviceSize.height * 0.3,
      child: const Center(
        child: Text('Something went wrong')
      ),
    );
  }
}
