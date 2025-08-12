import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_clone/core/router/route_paths.dart';
import 'package:whatsapp_clone/core/widgets/app_bar_widget.dart';
import 'package:whatsapp_clone/features/chats/presentation/providers/filtered_chats_provider.dart';
import 'package:whatsapp_clone/features/chats/presentation/widgets/chats_list_widget.dart';
import 'package:whatsapp_clone/features/chats/presentation/widgets/choice_chips_horizontal.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    // final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: AppBarWidget(
        title: 'WhatsApp',
        actionWidget: IconButton(
          icon: const Icon(Icons.camera_alt_outlined),
          onPressed: () {},
        ),
        popMenuButton: PopupMenuButton(
          position: PopupMenuPosition.under,
          elevation: 8,
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'new group', child: Text('New Group')),
            const PopupMenuItem(
              value: 'new community',
              child: Text('New Community'),
            ),
            const PopupMenuItem(value: 'read all', child: Text('Read All')),
            const PopupMenuItem(value: 'starred', child: Text('Starred')),
            const PopupMenuItem(
              value: 'linked devices',
              child: Text('Linked Devices'),
            ),
            const PopupMenuItem(value: 'settings', child: Text('Settings')),
          ],
          onSelected: (value) {
            if (value == 'starred messages') {
              debugPrint('You cliked on starred messages');
            }
            if (value == 'devices') {
              debugPrint('Connected devices button is clicked');
            }
            if (value == 'settings') {
              debugPrint('Settings is clicked');
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.only(left: 20, right: 20),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: [
              SizedBox(height: 20),
              // Text Search Field
              TextField(
                decoration: InputDecoration(
                  hint: const Text(
                    'Ask Meta AI or Search',
                    style: TextStyle(fontSize: 14),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withValues(alpha: 0.2),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: const Icon(Icons.search),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (inputValue) =>
                    ref.read(searchQueryProvider.notifier).state = inputValue,
              ),
              const SizedBox(height: 16),

              // Horizontal scroll view
              ChoiceChipsHorizontal(),

              const SizedBox(height: 8),

              // Chats list
              ChatsListWidget(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock, size: 10),
                  Text(
                    'Your personal messages are ',
                    style: TextStyle(fontSize: 10),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: Text(
                      'end-to-end encrypted',
                      style: TextStyle(fontSize: 10, color: Colors.green),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.goNamed(RoutePaths.add);
          context.push(RoutePaths.add);
        },
        child: const Icon(Icons.add_comment_rounded),
      ),
    );
  }
}
