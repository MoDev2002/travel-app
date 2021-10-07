import 'package:flutter/material.dart';

class TabBarMaterial extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChangeTab;
  const TabBarMaterial(
      {Key? key, required this.index, required this.onChangeTab})
      : super(key: key);

  Widget buildTabItem(
      {required int index,
      required IconData selectedIcon,
      required IconData notSelectedicon}) {
    final isSelected = index == this.index;
    return IconButton(
        onPressed: () => onChangeTab(index),
        icon: Icon(isSelected ? selectedIcon : notSelectedicon,
            size: 28, color: isSelected ? Colors.white : Colors.grey));
  }

  final placeholder = const Opacity(
    opacity: 0,
    child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)),
  );

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.primary,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(
              index: 0,
              selectedIcon: Icons.home_rounded,
              notSelectedicon: Icons.home_outlined),
          buildTabItem(
              index: 1,
              selectedIcon: Icons.favorite_rounded,
              notSelectedicon: Icons.favorite_border_rounded),
          placeholder,
          buildTabItem(
              index: 2,
              selectedIcon: Icons.bookmark_rounded,
              notSelectedicon: Icons.bookmark_border_rounded),
          buildTabItem(
              index: 3,
              selectedIcon: Icons.settings_rounded,
              notSelectedicon: Icons.settings_outlined),
        ],
      ),
    );
  }
}
