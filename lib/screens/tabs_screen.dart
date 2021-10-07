import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './main_screen.dart';
import '../widgets/bottom_bar.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedindex = 0;

  final List<Widget> _screen = [
    MainScreen(),
    const Center(
      child: Text(
        'Favorites',
        style: TextStyle(color: Colors.white),
      ),
    ),
    const Center(
      child: Text(
        'Saved',
        style: TextStyle(color: Colors.white),
      ),
    ),
    const Center(
      child: Text(
        'Settings',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    void _selectScreen(int index) {
      setState(() {
        selectedindex = index;
      });
    }

    return Scaffold(
      extendBody: true,
      body: _screen[selectedindex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 10,
        child: const Icon(
          CupertinoIcons.compass_fill,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          TabBarMaterial(index: selectedindex, onChangeTab: _selectScreen),
    );
  }
}
