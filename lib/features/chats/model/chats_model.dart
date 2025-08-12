// import 'dart:collection';

class ChatsModel {
  final String id;
  final String imageUrl;
  final String name;
  final String message;
  final String time;
  final String currentStatus;
  final bool sent;
  final bool sentAndRecieved;
  final bool seen;

  ChatsModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.message,
    required this.time,
    required this.currentStatus,
    this.sent = true,
    required this.sentAndRecieved,
    required this.seen,
  });
}
