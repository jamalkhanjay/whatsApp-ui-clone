import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hanging_around_wd_ui/features/chats/model/chats_model.dart';
import 'package:hanging_around_wd_ui/features/chats/model/list_data.dart';

// For filters
final chatTypeProvider = StateProvider<String>((ref) => 'All');

// Provider which will give us a list based on the above value
final filteredChatsProvider = Provider<List<ChatsModel>>((ref) {
  final chatsValue = ref.watch(chatTypeProvider);

  if (chatsValue == 'All') return users;

  return users.where((value) => value.currentStatus == chatsValue).toList();
});
