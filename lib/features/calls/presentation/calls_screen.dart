import 'package:flutter/material.dart';
import 'package:hanging_around_wd_ui/core/styles/text_styles.dart';
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
        popMenuButton: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'missed-calls',
              child: Text('Missed calls'),
            ),
            const PopupMenuItem(value: 'all-calls', child: Text('All calls')),
            const PopupMenuItem(value: 'settings', child: Text('Settings')),
          ],
          onSelected: (value) {
            if (value == 'missed-calls') {
              debugPrint('Here is the list of all missed-calls');
            }
            if (value == 'all-calls') {
              debugPrint('The list of all-calls');
            }
            if (value == 'settings') {
              debugPrint('Settings is clicked');
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Favourites', style: heading1),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // elevation: 0,
                        padding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),
                        // copywith method
                      ).copyWith(elevation: WidgetStateProperty.all(0)),
                      onPressed: () {},
                      child: Text('More', style: paragraphs),
                    ),
                  ],
                ),
              ),
              const FavouritesAndRecentCalls(),
              Divider(height: 2),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock, size: 10),
                  Text(
                    'Your personal calls are ',
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
              SizedBox(height: 48),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_call),
      ),
    );
  }
}
