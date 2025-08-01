import 'package:flutter/material.dart';
import 'package:hanging_around_wd_ui/core/widgets/app_bar_widget.dart';

class CommunititesScreen extends StatelessWidget {
  const CommunititesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Communities', actionWidget: Text('')),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Container(width: 100, height: 100, decoration: BoxDecoration()),
      ),
    );
  }
}
