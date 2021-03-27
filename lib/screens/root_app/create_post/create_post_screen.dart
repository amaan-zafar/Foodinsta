import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_insta/components/bottom_img_picker.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_dropdown.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/custom_textfield.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File _foodImg;
  final picker = ImagePicker();
  String _selectedUnit;
  List<String> _units = ['KG', 'Meals'];
  String _validate(String value, bool isRequired) {
    if (value.isEmpty && isRequired) return Constants.ERR_EMPTY_FIELD;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomBackground(),
        SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                centerTitle: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                    child: _buildForm(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  _buildForm(context) {
    return CustomAppCard(
      children: [
        SizedBox(height: 16),
        Text(
          'Tell us about the food',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Container(
            height: MediaQuery.of(context).size.height / 1.7,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  _buildUploadPhoto(context),
                  CustomTextField(
                    keyboardType: TextInputType.streetAddress,
                    hintText: 'Pickup location',
                    validator: (value) {
                      return _validate(value, true);
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                          keyboardType: TextInputType.number,
                          hintText: 'Approx. quantity',
                          validator: (value) {
                            return _validate(value, true);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomDropDown(
                          hint: Center(child: Text('Units')),
                          value: _selectedUnit,
                          list: _units,
                          onChanged: (value) {
                            setState(() {
                              _selectedUnit = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.phone,
                    hintText: 'Contact Details',
                    validator: (value) {
                      return _validate(value, true);
                    },
                  ),
                  CustomTextField(
                    minLines: 4,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    hintText: 'Description',
                    validator: (value) {
                      return _validate(value, true);
                    },
                  ),
                ],
              ),
            )),
        SizedBox(
          width: double.infinity,
          child: CustomTextButton(
            onPressed: () {},
            textOnButton: 'Post',
            color: Styles.buttonColor2,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildUploadPhoto(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return BottomImgPicker(
                      onTapGallery: () {
                        _getFoodImg(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                      onTapCamera: () {
                        _getFoodImg(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                    );
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Styles.iconColor),
                  borderRadius: BorderRadius.circular(16)),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      MdiIcons.cameraPlus,
                      color: Styles.iconColor,
                    ),
                    Text(
                      'Upload your food image',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Styles.iconColor),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        _foodImg != null
            ? Image.file(
                _foodImg,
                width: 180,
                height: 180,
                fit: BoxFit.fitHeight,
              )
            : Container()
      ],
    );
  }

  Future _getFoodImg(source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _foodImg = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
