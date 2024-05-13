import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, this.body, this.header, this.headerHeight});

  final Widget? body;
  final Widget? header;
  final double? headerHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 23, width: 40, child: Center(child: header)),
        Expanded(child: Container(width: 45, color: Colors.blue, child: body))
      ],
    );
  }
}
