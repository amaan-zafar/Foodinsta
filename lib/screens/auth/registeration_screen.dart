import 'dart:io';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_dropdown.dart';
import 'package:food_insta/models/app_types.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_textfield.dart';
import 'package:food_insta/screens/root_app/root_app.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:country_calling_code_picker/picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:food_insta/components/bottom_img_picker.dart';

class RegistrationForm extends StatefulWidget {
  final USERTYPE userType;

  const RegistrationForm({Key key, this.userType}) : super(key: key);
  @override
  _RegistrationFormState createState() => _RegistrationFormState(userType);
}

class _RegistrationFormState extends State<RegistrationForm> {
  final USERTYPE userType;
  bool isChecked = false;
  bool isVolunteer = false;
  Country _selectedCountry;
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  List<String> orgList = ['Nirman', 'NSS', 'Umang'];
  String _selectedOrg = 'Nirman';

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

  Future _getProfileImg(source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      if (pickedFile != null) {
        _profileImg = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future _getidProofImg(source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _idProofImg = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
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
                    child: buildForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
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

  buildForm() {
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
                  buildProfilePhoto(),
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
                  buildPhoneField(),
                  buildCSCPicker(),
                  CustomTextField(
                    minLines: 4,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    hintText: Constants.STREET_ADDRESS,
                    validator: (value) {
                      return _validate(value, true);
                    },
                  ),
                  buildNgoFields(),
                  buildVolunteerFields(),
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
              if (isChecked) _navigateToRootApp(context);
            },
            textOnButton: Constants.REGISTER_TEXT,
            color: Styles.buttonColor2,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget buildProfilePhoto() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext bc) {
              return BottomImgPicker(
                onTapGallery: () {
                  _getProfileImg(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
                onTapCamera: () {
                  _getProfileImg(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              );
            });
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
    );
  }

  Widget buildPhoneField() {
    return Row(
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
                  padding: const EdgeInsets.fromLTRB(8, 16, 0, 16),
                  child: Row(
                    children: [
                      Text(
                        _selectedCountry != null
                            ? _selectedCountry.callingCode
                            : '+91',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
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
    );
  }

  Widget buildCSCPicker() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Styles.textFieldColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
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
    );
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
  }

  Widget buildVolunteerFields() {
    return userType == USERTYPE.INDIVIDUAL
        ? Column(
            children: [
              CheckboxListTile(
                onChanged: (bool value) {
                  setState(() {
                    isVolunteer = value;
                  });
                },
                value: isVolunteer,
                title: Text('I am a volunteer',
                    style: Theme.of(context).textTheme.bodyText2),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              Visibility(
                visible: isVolunteer,
                child: Column(
                  children: [
                    CustomDropDown(
                      value: _selectedOrg,
                      list: orgList,
                      onChanged: (value) {
                        setState(() {
                          _selectedOrg = value;
                        });
                      },
                    ),
                    CustomTextField(
                      hintText: 'Identification number',
                      keyboardType: TextInputType.number,
                    )
                  ],
                ),
              )
            ],
          )
        : Container();
  }

  Widget buildNgoFields() {
    return userType == USERTYPE.NGO
        ? Column(
            children: [
              CustomTextField(
                keyboardType: TextInputType.number,
                hintText: Constants.REGISTERATION_NUMBER_TEXT,
                validator: (value) {
                  return _validate(value, true);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext bc) {
                          return BottomImgPicker(
                            onTapGallery: () {
                              _getidProofImg(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                            onTapCamera: () {
                              _getidProofImg(ImageSource.camera);
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
                            'UPLOAD ID PROOF',
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
              Visibility(
                visible: _idProofImg != null,
                child: Image.file(
                  _idProofImg,
                  width: 100,
                  height: 100,
                  fit: BoxFit.fitHeight,
                ),
              )
            ],
          )
        : Container();
  }
}
