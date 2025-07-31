import 'package:flutter/material.dart';
import 'package:hanging_around_wd_ui/core/styles/text_styles.dart';
import 'package:hanging_around_wd_ui/features/calls/models/data_list.dart';

class FavouritesAndRecentCalls extends StatelessWidget {
  const FavouritesAndRecentCalls({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...favourites.map(
          (f) => ListTile(
            contentPadding: EdgeInsets.zero,
            // leading: CircleAvatar(backgroundImage: AssetImage(f.imageUrl)),
            leading: CircleAvatar(child: Text(f.name[0])),
            title: Text(f.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.videocam_outlined),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Text('Recent', style: heading1),
        SizedBox(height: 10),

        ...recents.map(
          (r) => ListTile(
            contentPadding: EdgeInsets.zero,
            // leading: CircleAvatar(backgroundImage: AssetImage(r.imageUrl)),
            leading: CircleAvatar(child: Text(r.name[0])),
            title: Text(
              r.name,
              style: TextStyle(color: r.isMissed ? Colors.red : Colors.black),
            ),
            subtitle: Row(
              children: [
                Icon(
                  r.isOutgoing ? Icons.call_made : Icons.call_received,
                  size: 16,
                  color: r.isMissed ? Colors.red : Colors.green,
                ),
                const SizedBox(width: 4),
                Text(r.date),
              ],
            ),
            trailing: Icon(
              r.isVideoCall ? Icons.videocam_outlined : Icons.call,
            ),
          ),
        ),
      ],
    );
  }
}
