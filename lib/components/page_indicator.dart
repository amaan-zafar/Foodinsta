import 'package:flutter/material.dart';

List<Widget> buildPageIndicator(
    BuildContext context, int currentPage, int pages) {
  int numPages = pages;
  List<Widget> list = [];
  for (int i = 0; i < numPages; i++) {
    list.add(i == currentPage
        ? _indicator(true, context)
        : _indicator(false, context));
  }
  return list;
}

Widget _indicator(bool isActive, BuildContext context) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    height: 8.0,
    width: isActive ? 24.0 : 16.0,
    decoration: BoxDecoration(
      color: isActive
          ? Theme.of(context).primaryColorDark
          : Theme.of(context).secondaryHeaderColor,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );
}
