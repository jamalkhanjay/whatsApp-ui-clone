import 'package:flutter/material.dart';
import 'package:hanging_around_wd_ui/core/widgets/app_bar_widget.dart';
import 'package:hanging_around_wd_ui/enums/chat_enum.dart';
import 'package:hanging_around_wd_ui/features/chats/model/list_data.dart';
// import 'package:hanging_around_wd_ui/screens/testing_generate.dart';

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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // Applying map on list gives iterable while here children of
                // row wants list widgets, so at the last we write .toList()
                children: ChatEnum.values.map((item) {
                  return Padding(
                    padding: const EdgeInsetsGeometry.all(6),
                    child: ChoiceChip(
                      showCheckmark: false,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      label: Text(
                        // for example item recieve word all
                        // item.name[0] -> a   -> toUpperCase() -> A
                        // + item.name.substriing(1) means it will start from
                        // index 1 to the end which ll so it becomes All
                        item.name[0].toUpperCase() + item.name.substring(1),
                      ),
                      selected: selectedSegmentValue == item,
                      selectedColor:
                          Colors.green[100], // WhatsApp-style highlight
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300), // Border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onSelected: (bool selected) {
                        setState(() {
                          selectedSegmentValue = item;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),

              // -------- I have implemented this with Segmenetd buttons
              // But we can't seprate segment like in whats for this
              // We have to switch or implement the choiceChip
              // child: SegmentedButton<ChatEnum>(
              //   // showSelectedIcon: false,
              //   style: ButtonStyle(),
              //   segments: [
              //     ButtonSegment(value: ChatEnum.all, label: Text('All')),
              //     ButtonSegment(value: ChatEnum.unread, label: Text('Unread')),
              //     ButtonSegment(value: ChatEnum.groups, label: Text('Groups')),
              //     ButtonSegment(
              //       value: ChatEnum.communities,
              //       label: Text('Communities'),
              //     ),
              //     ButtonSegment(value: ChatEnum.pinned, label: Text('Pinned')),
              //   ],
              //   selected: <ChatEnum>{selectedSegmentValue},
              //   onSelectionChanged: (Set<ChatEnum> newSelction) {
              //     setState(() {
              //       selectedSegmentValue = newSelction.first;
              //     });
              //   },
              // ),
            ),
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
