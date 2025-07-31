import 'package:flutter/material.dart';
import 'package:hanging_around_wd_ui/core/widgets/app_bar_widget.dart';
import 'package:hanging_around_wd_ui/enums/chat_enum.dart';
import 'package:hanging_around_wd_ui/features/chats/model/list_data.dart';
// import 'package:hanging_around_wd_ui/screens/testing_generate.dart';
import 'package:hanging_around_wd_ui/features/chats/widgets/choice_chips_horizontal.dart';

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
        padding: const EdgeInsetsGeometry.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 0,
        ),
        child: Column(
          children: [
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

            const SizedBox(height: 16),

            // Chats list
            Expanded(
              // ScrollConfigration is used for hiding the scrollbar
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(
                  context,
                ).copyWith(scrollbars: false),
                child: ListView.separated(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return ListTile(
                      leading: CircleAvatar(child: Text(user.name[0])),
                      title: Text(
                        user.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(
                            user.sentAndRecieved && user.seen
                                ? Icons.done_all
                                : user.sentAndRecieved
                                ? Icons.done_all
                                : Icons.done,
                            size: 16,
                            color: user.sentAndRecieved && user.seen
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          SizedBox(width: 5),
                          Text(user.message),
                        ],
                      ),
                      trailing: Text(user.time),
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_comment_rounded),
      ),
    );
  }
}
