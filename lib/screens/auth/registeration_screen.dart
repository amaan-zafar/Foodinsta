import 'dart:io';

import 'package:csc_picker/dropdown_with_search.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/models/app_types.dart';
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
import 'package:country_calling_code_picker/picker.dart';
import 'package:csc_picker/csc_picker.dart';

class RegistrationForm extends StatefulWidget {
  final USERTYPE userType;

  const RegistrationForm({Key key, this.userType}) : super(key: key);
  @override
  _RegistrationFormState createState() => _RegistrationFormState(userType);
}

class _RegistrationFormState extends State<RegistrationForm> {
  final USERTYPE userType;

  bool isChecked = false;

  List<String> _states = Constants.STATE_CITY_JSON.keys.toList();

  String _selectedState = 'Assam';
  Country _selectedCountry;

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
  void initState() {
    super.initState();
    initCountry();
  }

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

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
                    child: buildCard(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  void _showCountryPicker() async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

  buildCard() {
    return CustomAppCard(
      children: [
        SizedBox(height: 16),
        Text(
          'Final step, fill out your details',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Container(
            height: MediaQuery.of(context).size.height / 1.7,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: CircleAvatar(
                        backgroundColor: Styles.iconColor,
                        radius: 52,
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
                                    borderRadius: BorderRadius.circular(50)),
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey[800],
                                ),
                              )),
                  ),
                  SizedBox(height: 8),
                  Text('Upload Profile Photo'),
                  SizedBox(height: 16),
                  CustomTextField(
                    keyboardType: TextInputType.name,
                    hintText: Constants.NAME_TEXT,
                    validator: (value) {
                      return _validate(value, true);
                    },
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showCountryPicker();
                        },
                        child: Expanded(
                            flex: 2,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              color: Styles.textFieldColor,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 16, 0, 16),
                                child: Row(
                                  children: [
                                    Text(_selectedCountry.callingCode),
                                    Icon(Icons.arrow_drop_down)
                                  ],
                                ),
                              ),
                            )),
                      ),
                      Expanded(
                        flex: 5,
                        child: CustomTextField(
                          keyboardType: TextInputType.phone,
                          hintText: '${Constants.PHONE_NUMBER_TEXT}',
                          validator: (value) {
                            return _validate(value, false);
                          },
                        ),
                      ),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    color: Styles.textFieldColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      child: CSCPicker(
                        ///Enable disable state dropdown
                        showStates: true,

                        /// Enable disable city drop down
                        showCities: true,
                        layout: Layout.vertical,

                        ///Enable (get flat with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only)
                        flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,

                        onCountryChanged: (value) {
                          setState(() {
                            countryValue = value;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            stateValue = value;
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            cityValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                  // CustomDropDown(
                  //   list: _states,
                  //   value: _selectedState,
                  //   onChanged: null,
                  // ),
                  // CustomDropDown(
                  //   list: _states,
                  //   value: _selectedState,
                  //   onChanged: null,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                  //   child: DropdownButtonHideUnderline(
                  //     child: Card(
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(16)),
                  //       color: Styles.textFieldColor,
                  //       child: DropdownWithSearch(
                  //         items: ['Assam', 'Bihar', 'Delhi'],
                  //         onChanged: () {},
                  //         placeHolder: 'State',
                  //         selected: null,
                  //         title: 'State',
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  CustomTextField(
                    keyboardType: TextInputType.multiline,
                    hintText: Constants.STREET_ADDRESS,
                    validator: (value) {
                      return _validate(value, true);
                    },
                  ),
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
                ],
              ),
            )),
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
    );
  }
}
