import 'package:capstone/Channel/channelPage.dart';
import 'package:capstone/Forum/Forum-Page.dart';
import 'package:capstone/Model/Icon/nav_bot_bar_icon_icons.dart';
import 'package:capstone/Notification/notification_ui.dart';
import 'package:capstone/profile/profile.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  List<Widget> page = [
    const ForumPage(),
    const ChannelPage(),
    NotifScreen(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() => _currentIndex = value);
        },
        items: const [
          BottomNavigationBarItem(
            label: "Forum",
            icon: Icon(
              NavBotBarIcon.forumicon,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: "Channel",
            icon: Icon(NavBotBarIcon.channelicon, size: 20),
          ),
          BottomNavigationBarItem(
            label: "Notifications",
            icon: Icon(NavBotBarIcon.notificon, size: 20),
          ),
          BottomNavigationBarItem(
            label: "Profiles",
            icon: Icon(NavBotBarIcon.profileicon, size: 20),
          ),
        ],
      ),
    );
  }
}
