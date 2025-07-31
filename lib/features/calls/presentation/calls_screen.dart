import 'package:flutter/material.dart';
import 'package:hanging_around_wd_ui/core/widgets/app_bar_widget.dart';
import 'package:hanging_around_wd_ui/features/calls/widgets/favourites_and_recent_calls.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Calls',
        actionWidget: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Favourites'),
                  ElevatedButton(onPressed: () {}, child: Text('More')),
                ],
              ),
              const FavouritesAndRecentCalls(),
            ],
          ),
        ),
      ),
    );
  }
}
