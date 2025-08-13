import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/chats/presentation/providers/filtered_chats_provider.dart';

class ChoiceChipsHorizontal extends ConsumerStatefulWidget {
  const ChoiceChipsHorizontal({super.key});

  @override
  ConsumerState<ChoiceChipsHorizontal> createState() =>
      _ChoiceChipsHorizontalState();
}

class _ChoiceChipsHorizontalState extends ConsumerState<ChoiceChipsHorizontal> {
  // ChatEnum selectedSegmentValue = ChatEnum.all;
  List<String> statusValue = [
    "All",
    "Unread",
    "Favourites",
    "Groups",
    "Communities",
    'Pinned',
  ];

  @override
  Widget build(BuildContext context) {
    final selectedChat = ref.watch(chatTypeProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 50,
        child: Row(
          // Applying map on list gives iterable while here children of
          // row wants list widgets, so at the last we write .toList()
          children: statusValue.map((item) {
            return Padding(
              padding: const EdgeInsetsGeometry.all(6),
              child: ChoiceChip(
                showCheckmark: false,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                label: Text(item),
                selected: selectedChat == item,
                selectedColor: Colors.green[100], // WhatsApp-style highlight
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.grey.shade300), // Border
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onSelected: (_) {
                  ref.read(chatTypeProvider.notifier).state = item;
                  ref.read(searchQueryProvider.notifier).state = '';
                },
              ),
            );
          }).toList(),
        ),
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
    );
  }
}
