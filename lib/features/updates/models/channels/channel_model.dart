class ChannelModel {
  final String channelName;
  final String description;
  final String date; // or time/day
  final int newMessages;
  final bool? link;
  final bool? image;
  final bool? video;

  ChannelModel({
    required this.channelName,
    required this.description,
    required this.date,
    required this.newMessages,
    this.link,
    this.image,
    this.video,
  });
}
