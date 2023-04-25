// ignore_for_file: prefer_const_constructors

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:material3_layout/material3_layout.dart';
import 'package:nimmadhi/pages/home_page.dart';
import 'package:nimmadhi/pages/profile_page.dart';
import 'package:nimmadhi/pages/emotions_page.dart';
import 'package:flutter/material.dart';

class AppRoute extends StatefulWidget {
  AppRoute({Key? key}) : super(key: key);

  @override
  State<AppRoute> createState() => _AppRouteState();
}

class _AppRouteState extends State<AppRoute> {
  final List<DestinationModel> _destinations = <DestinationModel>[
    DestinationModel(
        label: 'Home',
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home_filled),
        tooltip: 'Home page'),
    DestinationModel(
      label: 'Emotions',
      icon: const Icon(Icons.emoji_emotions_outlined),
      selectedIcon: const Icon(Icons.emoji_emotions_rounded),
      tooltip: 'Emotions Page',
    ),
    DestinationModel(
      label: 'Profile Page',
      icon: const Icon(Icons.account_circle_outlined),
      selectedIcon: const Icon(Icons.account_circle),
      tooltip: 'Profile Page',
    )
  ];
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    EmotionsPage(),
    //Text("Add"),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationScaffold(
        navigationType: NavigationTypeEnum.railAndBottomNavBar,
        navigationSettings: RailAndBottomSettings(
            destinations: _destinations, pages: _widgetOptions),
        theme: Theme.of(context));
  }
}
