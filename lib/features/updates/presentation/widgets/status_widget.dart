import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/styles/text_styles.dart';
import 'package:whatsapp_clone/features/updates/models/status/cards_list.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cardsList.length,
        itemBuilder: (context, index) {
          final card = cardsList[index];
          return Card(
            elevation: 2,
            child: Container(
              width: 250, // fixed with for horizontal cards
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(child: Text(card.name[0])),
                      Text(card.name, style: heading),
                    ],
                  ),
                  Text(card.topicTitle, style: heading1),
                  Text(card.description, style: paragraphs),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${card.city}, ', style: smallText),
                      Text('${card.time}, ', style: smallTextBold),
                      Text(card.date, style: smallTextBold),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
