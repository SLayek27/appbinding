import 'package:appbinding/src/components/Utils.dart';
import 'package:flutter/material.dart';
import 'components/BottomNavItem.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTapEvent;
  final List<BottomNavItem> items;
  final String navigationBackgroundColor;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTapEvent,
    required this.items,
    required this.navigationBackgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Utils.hexToColor(navigationBackgroundColor),
      currentIndex: currentIndex,
      showSelectedLabels: items.any((e) => e.label != null),
      showUnselectedLabels: items.any((e) => e.label != null),
      onTap: (index) {
        items[index].onTap();
        onTapEvent(index);
      },
      items: List.generate(items.length, (index) {
        final item = items[index];
        final bool isActive = index == currentIndex;

        return BottomNavigationBarItem(
          icon: Icon(
            item.icon,
            color: isActive ? item.activeColor : item.inactiveColor,
          ),
          label: item.label ?? "",
        );
      }),
    );
  }
}