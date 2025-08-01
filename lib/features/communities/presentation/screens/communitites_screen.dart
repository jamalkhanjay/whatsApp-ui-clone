import 'package:flutter/material.dart';
import 'package:hanging_around_wd_ui/core/widgets/app_bar_widget.dart';
import 'package:hanging_around_wd_ui/features/communities/presentation/widgets/cummunity_Item_Widget.dart';

class CommunititesScreen extends StatelessWidget {
  const CommunititesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Communities',
        actionWidget: Text(''),
        popMenuButton: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'all-communities',
              child: Text('All Communities'),
            ),

            const PopupMenuItem(value: 'settings', child: Text('Settings')),
          ],
          onSelected: (value) {
            if (value == 'all-communities') {
              debugPrint('You cliked on all-communities messages');
            }
            if (value == 'settings') {
              debugPrint('Settings is clicked');
            }
          },
        ),
      ),

      body: ListView(
        // padding: const EdgeInsets.all(12),
        children: [
          // New Community
          ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.group_add, color: Colors.green),
            ),
            title: const Text('New community'),
            onTap: () {},
          ),
          const SizedBox(height: 10),

          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CircleAvatar(),
            ),
            title: const Text('Build (). With Usaid-Asif'),
            onTap: () {},
          ),
          const Divider(height: 20),

          // Announcements
          buildCommunityItem(
            icon: Icons.campaign,
            bgColor: Colors.green.shade100,
            title: 'Announcements',
            subtitle: 'Hey guys wassup everyone, its…',
            trailingText: '18/07/2025',
          ),

          // Flutter
          buildCommunityItem(
            iconWidget: Icon(Icons.flutter_dash, color: Colors.blue),

            title: 'Flutter',
            subtitle: 'joined from the community',
            trailingText: '3:04 pm',
            showGreenDot: true,
          ),

          // Jobs
          buildCommunityItem(
            icon: Icons.group,
            bgColor: Colors.brown.shade100,
            title: 'Jobs',
            subtitle: 'Check out my new website "…',
            trailingText: '12:11 pm',
            showGreenDot: true,
          ),

          buildCommunityItem(
            icon: Icons.read_more,
            bgColor: const Color.fromARGB(255, 192, 192, 192),
            showGreenDot: true,
            title: 'Retrofit',
            subtitle: 'Learn retrofit here by click this',
            trailingText: '21/3/12',
          ),

          const SizedBox(height: 20),

          // View all
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios, size: 20),
            title: const Text('View all'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
