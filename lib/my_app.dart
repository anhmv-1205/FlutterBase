import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/components/flavor_banner.dart';
import 'package:flutter_base_project/ui/pages/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const FlavorBanner(child: LoginPage()),
    );
  }
}
