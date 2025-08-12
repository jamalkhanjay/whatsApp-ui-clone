import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/calls/presentation/screens/calls_screen.dart';
import 'package:whatsapp_clone/features/chats/presentation/screens/chat_screen.dart';
import 'package:whatsapp_clone/features/communities/presentation/screens/communitites_screen.dart';
import 'package:whatsapp_clone/features/updates/presentation/screen/updates_screen.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.chat),
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chats',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.circle),
            icon: Icon(Icons.circle_outlined),
            label: 'Updates',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.people),
            icon: Icon(Icons.people_alt_outlined),
            label: 'Communities',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.call),
            icon: Icon(Icons.call_outlined),
            label: 'Calls',
          ),
        ],
      ),
      body: <Widget>[
        ChatScreen(),
        UpdatesScreen(title: 'Updates'),
        CommunititesScreen(),
        CallsScreen(),
      ][currentPageIndex],
    );
  }
}
