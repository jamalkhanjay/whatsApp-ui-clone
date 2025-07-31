import 'package:hanging_around_wd_ui/features/calls/models/call_items.dart';

final List<CallItems> favourites = [
  CallItems(name: "Meee", imageUrl: "assets/me.jpg", date: "01 July"),
  CallItems(name: "Sami", imageUrl: "assets/sur.jpg", date: "21 Aug"),
  CallItems(name: "Uzair Bro", imageUrl: "assets/uzair.jpg", date: "19 Feb"),
];

final List<CallItems> recents = [
  CallItems(
    name: "Zaryab",
    imageUrl: "assets/zaryab.jpg",
    date: "28 July, 9:16 pm",
    isVideoCall: false,
  ),
  CallItems(
    name: "Tajamul",
    imageUrl: "assets/tajamul.jpg",
    date: "28 July, 1:45 pm",
    isOutgoing: true,
    isVideoCall: true,
  ),
  CallItems(
    name: "Zahid",
    imageUrl: "assets/zahid.jpg",
    date: "27 July, 11:43 pm",
    isOutgoing: true,
  ),
  CallItems(
    name: "Zarmash",
    imageUrl: "assets/zahid.jpg",
    date: "27 July, 11:43 pm",
    isOutgoing: false,
    isMissed: true,
  ),
  CallItems(
    name: "Aemal",
    imageUrl: "assets/zahid.jpg",
    date: "27 July, 11:43 pm",
    isOutgoing: true,
    isVideoCall: true,
  ),
  CallItems(
    name: "Hashir",
    imageUrl: "assets/zahid.jpg",
    date: "27 July, 11:43 pm",
    isOutgoing: false,
  ),
  CallItems(
    name: "Jamal",
    imageUrl: "assets/zahid.jpg",
    date: "27 July, 11:43 pm",
    isOutgoing: false,
    isVideoCall: true,
    isMissed: true,
  ),
  CallItems(
    name: "Numan",
    imageUrl: "assets/zahid.jpg",
    date: "27 July, 11:43 pm",
    isOutgoing: true,
  ),
];
