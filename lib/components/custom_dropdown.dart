import 'package:flutter/material.dart';
import 'package:food_insta/theme.dart';

class CustomDropDown extends StatelessWidget {
  final Function(dynamic) onChanged;
  final List<dynamic> list;
  final double itemHeight;
  final dynamic value;
  final hint;
  const CustomDropDown(
      {Key key,
      this.onChanged,
      this.list,
      this.itemHeight = 56,
      this.value,
      this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonHideUnderline(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: DropdownButton(
            hint: hint,
            isExpanded: true,
            elevation: 2,
            itemHeight: itemHeight,
            value: value,
            onChanged: onChanged,
            items: list.map((indexValue) {
              return DropdownMenuItem(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 16, 0, 16),
                  child: new Text(
                    indexValue,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                value: indexValue,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
