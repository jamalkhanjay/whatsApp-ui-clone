import 'package:flutter/material.dart';
import 'package:hanging_around_wd_ui/core/enums/chat_enum.dart';

class ChoiceChipsHorizontal extends StatefulWidget {
  const ChoiceChipsHorizontal({super.key});

  @override
  State<ChoiceChipsHorizontal> createState() => _ChoiceChipsHorizontalState();
}

class _ChoiceChipsHorizontalState extends State<ChoiceChipsHorizontal> {
  ChatEnum selectedSegmentValue = ChatEnum.all;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 50,
        child: Row(
          // Applying map on list gives iterable while here children of
          // row wants list widgets, so at the last we write .toList()
          children: ChatEnum.values.map((item) {
            return Padding(
              padding: const EdgeInsetsGeometry.all(6),
              child: ChoiceChip(
                showCheckmark: false,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                label: Text(
                  // for example item recieve word all
                  // item.name[0] -> a   -> toUpperCase() -> A
                  // + item.name.substriing(1) means it will start from
                  // index 1 to the end which ll so it becomes All
                  item.name[0].toUpperCase() + item.name.substring(1),
                ),
                selected: selectedSegmentValue == item,
                selectedColor: Colors.green[100], // WhatsApp-style highlight
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
