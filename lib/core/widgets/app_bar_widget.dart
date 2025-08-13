import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/text_styling/app_text_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    required this.actionWidget,
    required this.popMenuButton,
  });

  final String title;
  final Widget actionWidget;
  final PopupMenuButton popMenuButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: title == 'WhatsApp'
            ? context.getTitle
            : title == 'Select Contact'
            ? context.addContactPage
            : context.getOtherTitles,
      ),
      actions: [
        actionWidget,
        popMenuButton,
        // IconButton(
        //   icon: const Icon(Icons.more_vert),
        //   onPressed: () {
        //     // More options action
        //   },
        // ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
