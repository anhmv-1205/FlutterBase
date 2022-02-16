import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/components/components.dart';
import 'package:flutter_base_project/ui/pages/home/home_page.dart';
import 'package:flutter_base_project/ui/pages/profile/profile_page.dart';

import 'bloc/bottom_navbar_bloc.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabBarPageState();
  }
}

class _TabBarPageState extends State<TabBarPage> {
  late PageController _pageController;
  final _bottomNavBarBloc = BottomNavBarBloc();

  @override
  void initState() {
    _pageController = PageController(initialPage: _bottomNavBarBloc.defaultTab.index);
    _bottomNavBarBloc.itemStream.listen((event) {
      _pageController.jumpToPage(event.index);
    });
    super.initState();
  }

  @override
  void dispose() {
    _bottomNavBarBloc.close();
    _pageController.dispose();
    super.dispose();
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
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: Colors.grey.withOpacity(0.4),
          ),
        ),
      ),
      child: StreamBuilder(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultTab,
        builder: (BuildContext context, AsyncSnapshot<TabType> snapshot) {
          return BottomNavigationBar(
            items: TabType.values
                .map(
                  (item) => _createNavItem(item),
                )
                .toList(),
            currentIndex: snapshot.data!.index,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
            selectedItemColor: const Color(0xff5b60ec),
            unselectedItemColor: Colors.grey,
            elevation: 0,
            onTap: _bottomNavBarBloc.pickItem,
          );
        },
      ),
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
