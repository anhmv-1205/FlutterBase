import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

enum TabType { home, search, add, notifications, person }

class BottomNavBarBloc {

  var defaultTab = TabType.home;

  final _navBarController = BehaviorSubject.seeded(TabType.home);

  Stream<TabType> get itemStream => _navBarController.stream;

  void pickItem(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(TabType.home);
        break;
      case 1:
        _navBarController.sink.add(TabType.search);
        break;
      case 2:
        _navBarController.sink.add(TabType.add);
        break;
      case 3:
        _navBarController.sink.add(TabType.notifications);
        break;
      case 4:
        _navBarController.sink.add(TabType.person);
        break;
    }
  }

  close() {
    _navBarController.close();
  }
}

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
