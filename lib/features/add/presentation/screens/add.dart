import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/widgets/app_bar_widget.dart';
import 'package:whatsapp_clone/features/add/presentation/widgets/add_something.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Select Contact',
        actionWidget: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        popMenuButton: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(child: Text('First button')),
          ],
        ),
      ),
      body: Column(
        children: [
          AddSomething(
            leading: CircleAvatar(child: Icon(Icons.group_add)),
            title: Text('Add group'),
          ),
          AddSomething(
            leading: CircleAvatar(child: Icon(Icons.person_add_alt_1)),
            title: Text('Add contact'),
            trailing: Icon(Icons.qr_code),
          ),
          AddSomething(
            leading: CircleAvatar(child: Icon(Icons.groups)),
            title: Text('New community'),
          ),
        ],
      ),
    );
  }
}
