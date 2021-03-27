import 'package:flutter/material.dart';

class BottomImgPicker extends StatelessWidget {
  final Function onTapGallery;
  final Function onTapCamera;

  const BottomImgPicker({Key key, this.onTapGallery, this.onTapCamera})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: new Wrap(
          children: <Widget>[
            new ListTile(
                leading: new Icon(Icons.photo_library),
                title: new Text('Photo Library'),
                onTap: onTapGallery),
            new ListTile(
              leading: new Icon(Icons.photo_camera),
              title: new Text('Camera'),
              onTap: onTapCamera,
            ),
          ],
        ),
      ),
    );
  }
}
