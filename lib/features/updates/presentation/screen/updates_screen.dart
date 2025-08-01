import 'package:flutter/material.dart';
import 'package:hanging_around_wd_ui/core/widgets/app_bar_widget.dart';
import 'package:hanging_around_wd_ui/features/updates/presentation/widgets/channels_widget.dart';
import 'package:hanging_around_wd_ui/features/updates/presentation/widgets/status_widget.dart';
import 'package:hanging_around_wd_ui/core/styles/text_styles.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: title,
        actionWidget: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        popMenuButton: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'status', child: Text('Status privacy')),
            const PopupMenuItem(value: 'settings', child: Text('Settings')),
          ],
          onSelected: (value) {
            if (value == 'status') {
              debugPrint('You cliked on status.');
            }
            if (value == 'settings') {
              debugPrint('Settings is clicked');
            }
          },
        ),
      ),
      body: Container(
        // margin: EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            // shrinkWrap: true,
            children: [
              Text('Status', style: heading1),
              const SizedBox(height: 10),
              const StatusWidget(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Channels', style: heading1),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                    ).copyWith(elevation: WidgetStateProperty.all(0)),
                    child: Text('Explore', style: paragraphs),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ChannelsWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
