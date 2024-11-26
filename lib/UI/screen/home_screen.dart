import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malsan_plc/UI/screen/comunication_screen.dart';
import 'package:malsan_plc/UI/screen/profile_screen.dart';
import 'package:malsan_plc/UI/screen/task_screen.dart';

import '../widget/app_bar.dart';
import '../widget/custom_bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pages=[const TaskScreen(),const CommunicationScreen(),const ProfileScreen()];
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:[
                const CustomAppBars(),
                Expanded(child: _pages[_currentIndex]),
              ]
          ),
        ),
      bottomNavigationBar: CustomBottomNavigationBar(
      currentIndex: _currentIndex,
      onTabSelected: _onTabSelected,
    ),
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
