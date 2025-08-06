import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hanging_around_wd_ui/features/chats/model/list_data.dart';
import 'package:hanging_around_wd_ui/features/chats/presentation/providers/filtered_chats_provider.dart';

class ChatsListWidget extends ConsumerWidget {
  const ChatsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredList = ref.watch(filteredChatsProvider);

    return Column(
      children: [
        ...filteredList.map((user) {
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
            trailing: Column(
              children: [
                Text(user.time),
                Text(user.currentStatus, style: TextStyle(color: Colors.green)),
              ],
            ),
            dense: true,
            contentPadding: EdgeInsets.zero,
          );
        }),
      ],
    );
  }
}
