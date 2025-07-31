import 'package:flutter/material.dart';
import 'package:hanging_around_wd_ui/core/widgets/app_bar_widget.dart';

class CommunititesScreen extends StatelessWidget {
  const CommunititesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: 'Communities', actionWidget: Text('')),
    );
  }
}
