import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final Function(dynamic) onChanged;
  final List<dynamic> list;
  final double itemHeight;
  final dynamic value;

  const CustomDropDown(
      {Key key, this.onChanged, this.list, this.itemHeight = 56, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: DropdownButton(
          elevation: 0,
          itemHeight: itemHeight,
          value: value,
          onChanged: onChanged,
          items: list.map((code) {
            return DropdownMenuItem(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: new Text(code),
              ),
              value: code,
            );
          }).toList(),
        ),
      ),
    );
  }
}
