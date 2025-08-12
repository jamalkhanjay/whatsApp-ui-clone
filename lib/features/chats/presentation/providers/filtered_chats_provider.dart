import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/chats/model/chats_model.dart';
import 'package:whatsapp_clone/features/chats/model/list_data.dart';

// For filters
final chatTypeProvider = StateProvider<String>((ref) => 'All');

// For searching - a Seachquery provider
final searchQueryProvider = StateProvider<String>((ref) => '');

// Provider which will give us a list based on the above value
final filteredChatsProvider = Provider<List<ChatsModel>>((ref) {
  final chatsValue = ref.watch(chatTypeProvider);
  final searchQuery = ref.watch(searchQueryProvider);

  List<ChatsModel> userList = users;

  // If any choice chip Button is clicked
  if (chatsValue != 'All') {
    userList = users
        .where((value) => value.currentStatus == chatsValue)
        .toList();
  }

  // For Search Query
  if (searchQuery.isNotEmpty) {
    userList = users
        .where(
          (user) => user.name.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }

  return userList;
});
