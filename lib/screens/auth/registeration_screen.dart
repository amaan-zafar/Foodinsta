import 'dart:io';

import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_scaffold.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_dropdown.dart';
import 'package:food_insta/components/custom_textfield.dart';
import 'package:food_insta/screens/root_app/root_app.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/constants.dart' as Constants;

class RegistrationForm extends StatefulWidget {
  final int userType;

  const RegistrationForm({Key key, this.userType}) : super(key: key);
  @override
  _RegistrationFormState createState() => _RegistrationFormState(userType);
}

class _RegistrationFormState extends State<RegistrationForm> {
  final int userType;

  bool isChecked = false;

  List<String> _states = Constants.STATE_CITY_JSON.keys.toList();

  String _selectedState = 'Assam';

  List<String> _cities = [];

  final _formKey = GlobalKey<FormState>();

  File _profileImg;
  File _idProofImg;
  final picker = ImagePicker();

  _RegistrationFormState(this.userType);

  String _validate(String value, bool isRequired) {
    if (value.isEmpty && isRequired) return Constants.ERR_EMPTY_FIELD;
    return null;
  }

  _navigateToRootApp(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => RootApp()));
  }

  Future _imgFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _profileImg = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future _imgFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _profileImg = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                    padding:
                        EdgeInsets.fromLTRB(12, 8, 12, Styles.bottomPadding),
                    child: CustomAppCard(
                      children: [
                        SizedBox(height: 16),
                        Text(
                          'Final step, fill out your details',
                          style: Theme.of(context).textTheme.headline2,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: CircleAvatar(
                              backgroundColor: Styles.iconColor,
                              radius: 55,
                              child: _profileImg != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.file(
                                        _profileImg,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: 100,
                                      height: 100,
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey[800],
                                      ),
                                    )),
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          keyboardType: TextInputType.name,
                          hintText: Constants.NAME_TEXT,
                          validator: (value) {
                            return _validate(value, true);
                          },
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          keyboardType: TextInputType.emailAddress,
                          hintText:
                              '${Constants.EMAIL_TEXT} (${Constants.OPTIONAL_TEXT})',
                          validator: (value) {
                            return _validate(value, false);
                          },
                        ),
                        SizedBox(height: 16),
                        CustomDropDown(
                          list: _states,
                          value: _selectedState,
                          onChanged: null,
                        ),
                        SizedBox(height: 16),
                        CustomDropDown(
                          list: _states,
                          value: _selectedState,
                          onChanged: null,
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          keyboardType: TextInputType.multiline,
                          hintText: Constants.STREET_ADDRESS,
                          validator: (value) {
                            return _validate(value, true);
                          },
                        ),
                        SizedBox(height: 16),
                        userType == 2
                            ? CustomTextField(
                                keyboardType: TextInputType.text,
                                hintText:
                                    '${Constants.WEBSITE_TEXT} (${Constants.OPTIONAL_TEXT})',
                                validator: (value) {
                                  return _validate(value, false);
                                },
                              )
                            : Container(),
                        SizedBox(height: 16),
                        userType == 1
                            ? CustomTextField(
                                keyboardType: TextInputType.emailAddress,
                                hintText: Constants.REGISTERATION_NUMBER_TEXT,
                                validator: (value) {
                                  return _validate(value, true);
                                },
                              )
                            : Container(),
                        CheckboxListTile(
                          title: Text(
                            Constants.ACEEPT_TNC,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          value: isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              isChecked = newValue;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: CustomTextButton(
                            onPressed: () {
                              _navigateToRootApp(context);
                            },
                            textOnButton: Constants.REGISTER_TEXT,
                            color: Styles.buttonColor2,
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
