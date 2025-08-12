import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_clone/features/chats/presentation/providers/filtered_chats_provider.dart';

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
                SizedBox(width: 2),
                Expanded(child: Text(user.message)),
              ],
            ),
            trailing: Column(
              children: [
                Text(user.time),
                Text(user.currentStatus, style: TextStyle(color: Colors.green)),
              ],
            ),
            dense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(4),
            ),
            onTap: () => {
              context.pushNamed(
                'chatDetail',
                pathParameters: {'chatId': user.id.toString()},
              ),

              // I have implemented dialog on this first
              // showDialog(
              //   context: context,
              //   builder: (BuildContext context) => AlertDialog(
              //     title: Text(user.name),
              //     content: Text('You clicked on the ${user.name} chat.!'),
              //     actions: <Widget>[
              //       TextButton(
              //         onPressed: () => Navigator.pop(context),
              //         child: Text('Cancel'),
              //       ),
              //       TextButton(
              //         onPressed: () => Navigator.pop(context),
              //         child: Text('OK'),
              //       ),
              //     ],
              //   ),
              // ),
            },
          );
        }),
      ],
    );
  }
}
