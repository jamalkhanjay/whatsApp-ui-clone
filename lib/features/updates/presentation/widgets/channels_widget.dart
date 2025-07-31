import 'package:flutter/material.dart';
import 'package:hanging_around_wd_ui/core/styles/text_styles.dart';
import 'package:hanging_around_wd_ui/features/updates/models/channels/channels_list.dart';

class ChannelsWidget extends StatefulWidget {
  const ChannelsWidget({super.key});

  @override
  State<ChannelsWidget> createState() => _ChannelsWidgetState();
}

class _ChannelsWidgetState extends State<ChannelsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 64.0),
      child: Column(
        children: [
          // Mapping the list direclty into a ListTile using spread Operator
          ...channelsList.map((channel) {
            bool isMediaAvailable =
                channel.link != null ||
                channel.video != null ||
                channel.image != null;
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(child: Text(channel.channelName[0])),
              title: Text(channel.channelName, style: heading1),
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: isMediaAvailable,

                    child: Icon(
                      channel.link != null
                          ? Icons.link
                          : channel.image != null
                          ? Icons.image
                          : channel.video != null
                          ? Icons.videocam
                          : null,
                      size: 16,
                      color: const Color.fromARGB(255, 130, 130, 130),
                    ),
                  ),

                  Visibility(
                    visible: isMediaAvailable,
                    child: const SizedBox(width: 3),
                  ),
                  // : const SizedBox.shrink(),
                  Text(channel.description, style: paragraphs),
                ],
              ),
              trailing: Column(
                children: [
                  Text(channel.date, style: smallText),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      // color: Theme.of(context).colorScheme.primaryFixed,
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    height: 25,
                    width: 25,
                    child: Center(
                      child: Text(
                        channel.newMessages.toString(),
                        style: messages,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:hanging_around_wd_ui/core/styles/text_styles.dart';
// import 'package:hanging_around_wd_ui/features/updates/models/channels/channels_list.dart';

// class ChannelsWidget extends StatefulWidget {
//   const ChannelsWidget({super.key});

//   @override
//   State<ChannelsWidget> createState() => _ChannelsWidgetState();
// }

// class _ChannelsWidgetState extends State<ChannelsWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 64.0),
//       child: ListView.builder(
//         shrinkWrap: true,
//         // physics: NeverScrollableScrollPhysics(),
//         itemCount: channelsList.length,
//         itemBuilder: (context, index) {
//           final channel = channelsList[index];
//           bool isMediaAvailable =
//               channel.link != null ||
//               channel.video != null ||
//               channel.image != null;
//           return ListTile(
//             contentPadding: EdgeInsets.zero,
//             leading: CircleAvatar(child: Text(channel.channelName[0])),
//             title: Text(channel.channelName, style: heading1),
//             subtitle: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Visibility(
//                   visible: isMediaAvailable,

//                   child: Icon(
//                     channel.link != null
//                         ? Icons.link
//                         : channel.image != null
//                         ? Icons.image
//                         : channel.video != null
//                         ? Icons.videocam
//                         : null,
//                     size: 16,
//                     color: const Color.fromARGB(255, 130, 130, 130),
//                   ),
//                 ),

//                 Visibility(
//                   visible: isMediaAvailable,
//                   child: const SizedBox(width: 3),
//                 ),
//                 // : const SizedBox.shrink(),
//                 Text(channel.description, style: paragraphs),
//               ],
//             ),
//             trailing: Column(
//               children: [
//                 Text(channel.date, style: smallText),
//                 Container(
//                   margin: EdgeInsets.only(top: 5),
//                   decoration: BoxDecoration(
//                     // color: Theme.of(context).colorScheme.primaryFixed,
//                     color: Colors.green,
//                     shape: BoxShape.circle,
//                   ),
//                   height: 25,
//                   width: 25,
//                   child: Center(
//                     child: Text(
//                       channel.newMessages.toString(),
//                       style: messages,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
