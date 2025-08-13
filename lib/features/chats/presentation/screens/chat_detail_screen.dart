import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/widgets/app_bar_widget.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key, required this.chatId});

  final String chatId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Zaryab',
        actionWidget: IconButton(onPressed: () {}, icon: Icon(Icons.add_call)),
        popMenuButton: PopupMenuButton(
          itemBuilder: (context) {
            return [PopupMenuItem(child: Icon(Icons.chevron_left))];
          },
        ),
      ),
    );
  }
}
