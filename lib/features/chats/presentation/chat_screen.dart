import 'package:flutter/material.dart';
import 'package:hanging_around_wd_ui/core/widgets/app_bar_widget.dart';
import 'package:hanging_around_wd_ui/core/enums/chat_enum.dart';
import 'package:hanging_around_wd_ui/features/chats/presentation/widgets/chats_list_widget.dart';
import 'package:hanging_around_wd_ui/features/chats/presentation/widgets/choice_chips_horizontal.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatEnum selectedSegmentValue = ChatEnum.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'WhatsApp',
        actionWidget: IconButton(
          icon: const Icon(Icons.camera_alt_outlined),
          onPressed: () {
            // Search action
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.only(left: 20, right: 20),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: [
              SizedBox(height: 20),
              // Text Search Field
              TextField(
                decoration: InputDecoration(
                  hint: const Text(
                    'Ask Meta AI or Search',
                    style: TextStyle(fontSize: 14),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withValues(alpha: 0.2),
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Horizontal scroll view
              ChoiceChipsHorizontal(),

              const SizedBox(height: 8),

              // Chats list
              ChatsListWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock, size: 10),
                  Text(
                    'Your personal messages are ',
                    style: TextStyle(fontSize: 10),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: Text(
                      'end-to-end encrypted',
                      style: TextStyle(fontSize: 10, color: Colors.green),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_comment_rounded),
      ),
    );
  }
}
