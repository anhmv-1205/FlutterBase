import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/components/components.dart';
import 'package:flutter_base_project/ui/pages/home/home_page.dart';
import 'package:flutter_base_project/ui/pages/profile/profile_page.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabBarPageState();
  }
}

class _TabBarPageState extends State<TabBarPage> {
  var _currentTab = 2;

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentTab);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Txt(text: "Flutter App"),
      backgroundColor: const Color(0xff5b60ec),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      items: TabType.values
          .map(
            (item) => _createNavItem(item),
          )
          .toList(),
      currentIndex: _currentTab,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xff5b60ec),
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() {
          _currentTab = index;
          _pageController.jumpToPage(_currentTab);
        });
      },
    );
  }

  BottomNavigationBarItem _createNavItem(TabType item) {
    final itemIcon = item == TabType.add
        ? CircleAvatar(
            child: Icon(
              item.icon,
              color: Colors.white,
            ),
            backgroundColor: const Color(0xff5b60ec),
          )
        : Icon(item.icon);
    return BottomNavigationBarItem(icon: itemIcon, label: item.title);
  }

  Widget _buildBody() {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: TabType.values.length,
      controller: _pageController,
      itemBuilder: (context, index) => index == 0 ? const HomePage() : const ProfilePage(),
    );
  }
}

enum TabType { home, search, add, notifications, person }

extension TabItem on TabType {
  IconData get icon {
    switch (this) {
      case TabType.home:
        return Icons.home;
      case TabType.search:
        return Icons.search;
      case TabType.add:
        return Icons.add;
      case TabType.notifications:
        return Icons.notifications;
      case TabType.person:
        return Icons.person_outline;
    }
  }

  String get title {
    switch (this) {
      case TabType.home:
        return "Home";
      case TabType.search:
        return "Search";
      case TabType.add:
        return "Add";
      case TabType.notifications:
        return "Notifications";
      case TabType.person:
        return "Person";
    }
  }
}
