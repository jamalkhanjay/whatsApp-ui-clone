class CallItems {
  final String name;
  final String imageUrl;
  final String date;
  final bool isVideoCall;
  final bool isMissed;
  final bool isOutgoing;

  CallItems({
    required this.name,
    required this.imageUrl,
    required this.date,
    this.isVideoCall = false,
    this.isMissed = false,
    this.isOutgoing = true,
  });
}
