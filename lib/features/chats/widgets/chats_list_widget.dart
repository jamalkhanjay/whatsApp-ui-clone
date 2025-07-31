import 'package:flutter/material.dart';
import 'package:hanging_around_wd_ui/features/chats/model/list_data.dart';

class ChatsListWidget extends StatelessWidget {
  const ChatsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...users.map((user) {
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
        }),
      ],
    );
  }
}
