import 'package:flutter/material.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/models/dark_theme_provder.dart';
import 'package:food_insta/theme.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBarItem {
  CustomBottomNavBarItem({this.iconData, this.text, this.color});
  IconData iconData;
  String text;
  Color color;
}

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<CustomBottomNavBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
        darkThemeProvider: darkThemeProvider,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 4,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: BottomAppBar(
        elevation: 4,
        shape: widget.notchedShape,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items,
          ),
        ),
        // color: Styles.screenBgColor,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    CustomBottomNavBarItem item,
    int index,
    ValueChanged<int> onPressed,
    DarkThemeProvider darkThemeProvider,
  }) {
    Color color = item.color;
    Color selectedTabBgColor = _selectedIndex == index
        ? darkThemeProvider.darkTheme
            ? Color(0xFF252525)
            : Color(0xFFE5E5E5)
        : widget.color;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: selectedTabBgColor,
            height: widget.height * 0.8,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () => onPressed(index),
                child: Icon(item.iconData, color: color, size: widget.iconSize),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
