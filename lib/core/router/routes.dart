import 'package:go_router/go_router.dart';
import 'package:whatsapp_clone/core/router/route_paths.dart';
import 'package:whatsapp_clone/features/add/presentation/screens/add.dart';
import 'package:whatsapp_clone/features/chats/presentation/screens/chat_detail_screen.dart';
import 'package:whatsapp_clone/widgets/navigation_bar_widget.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => NavigationBarWidget(),
    ),
    GoRoute(path: RoutePaths.add, builder: (context, state) => Add()),
    // Dynamic route
    GoRoute(
      name: 'chatDetail',
      path: RoutePaths.chatDetail,
      builder: (context, state) {
        // Getting chat id from path-parameter
        final chatId = state.pathParameters['chatId'];
        return ChatDetailScreen(chatId: chatId!);
      },
    ),
  ],
);
