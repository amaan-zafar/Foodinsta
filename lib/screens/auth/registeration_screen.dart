import 'dart:io';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/controllers/login_controller.dart';
import 'package:food_insta/controllers/regis_controller.dart';
import 'package:food_insta/controllers/dark_theme_provder.dart';
import 'package:food_insta/controllers/app_user_controller.dart';
import 'package:food_insta/repository/ngo_list_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_textfield.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/screens/root_app/root_app.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:csc_picker/csc_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:food_insta/components/bottom_img_picker.dart';
import 'package:provider/provider.dart';

class RegistrationForm extends StatefulWidget {
  final List<Ngo> ngoList;
  const RegistrationForm({
    Key key,
    this.ngoList,
  }) : super(key: key);
  @override
  _RegistrationFormState createState() => _RegistrationFormState(ngoList);
}

class _RegistrationFormState extends State<RegistrationForm> {
  final List<Ngo> ngoList;
  // Common fields
  String _name;
  String _cityValue;
  String _phone;
  String _address;
  File _profileImg;
  // Ngo
  String _regisNo;
  File _idPhoto;
  // Individual
  bool _isVolunteer = false;
  Ngo _selectedNgo;
  String _volId;

  USERTYPE _userType;
  bool _isChecked = false;

  final _formKey = GlobalKey<FormState>();
  File _idProofImg;
  final picker = ImagePicker();

  _RegistrationFormState(
    this.ngoList,
  );

  String _validate(String value, bool isRequired) {
    if (value.isEmpty && isRequired) return Constants.ERR_EMPTY_FIELD;
    return null;
  }

  String _validatePhone(String value) {
    int _phone = int.tryParse(value);
    if (value.length != 10 || _phone == null)
      return 'Invalid Phone Number';
    else
      return null;
  }

  String _getUserTypeName(USERTYPE userType) {
    switch (userType) {
      case USERTYPE.NGO:
        return "NGO";
      case USERTYPE.INDIVIDUAL:
        return "";
      case USERTYPE.BUSINESS:
        return "Business";
      default:
        return "";
    }
  }

  _navigateToRootApp(BuildContext context) {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => RootApp()),
        ModalRoute.withName('/'));
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
    var darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    _userType = Provider.of<AppUserController>(context, listen: false).userType;
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
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    child: _buildForm(darkThemeProvider),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  _buildForm(DarkThemeProvider darkThemeProvider) {
    String userTypeName = _getUserTypeName(_userType);
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildProfilePhoto(),
                    SizedBox(height: 8),
                    Text('Upload Profile Photo'),
                    SizedBox(height: 16),
                    CustomTextField(
                      onSaved: (value) {
                        _name = value;
                      },
                      keyboardType: TextInputType.name,
                      hintText: '$userTypeName Name',
                      validator: (value) {
                        return _validate(value, true);
                      },
                    ),
                    CustomTextField(
                      onSaved: (value) {
                        _phone = value;
                      },
                      keyboardType: TextInputType.phone,
                      hintText: '${Constants.PHONE_NUMBER_TEXT}',
                      validator: (value) {
                        return _validatePhone(value);
                      },
                    ),
                    _buildCSCPicker(darkThemeProvider),
                    CustomTextField(
                      onSaved: (value) {
                        _address = value;
                      },
                      minLines: 4,
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      hintText: Constants.STREET_ADDRESS,
                      validator: (value) {
                        return _validate(value, true);
                      },
                    ),
                    _buildNgoFields(),
                    _buildVolunteerFields(darkThemeProvider),
                    CheckboxListTile(
                      title: Text(
                        Constants.ACEEPT_TNC,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      value: _isChecked,
                      onChanged: (newValue) {
                        setState(() {
                          _isChecked = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ],
                ),
              ),
            )),
        Consumer<RegisController>(builder: (context, controller, child) {
          String email =
              Provider.of<LoginController>(context, listen: false).email;
          print('Email at login screen is $email');
          if (controller.registrationState == RegistrationState.Loading) {
            return CircularProgressIndicator();
          } else {
            return SizedBox(
              width: double.infinity,
              child: CustomTextButton(
                highlightColor: Colors.lightBlue,
                onPressed: () {
                  if (_formKey.currentState.validate() &&
                      _isChecked &&
                      _cityValue != null) {
                    _formKey.currentState.save();
                    Provider.of<AppUserController>(context, listen: false)
                        .setUserObject(
                      UserObject(
                        name: _name,
                        address: _address,
                        city: _cityValue,
                        email: null,
                        volId: _volId,
                        profileImage: _profileImg,
                        isVol: _isVolunteer,
                        idPhoto: _idPhoto,
                        phone: _phone,
                        orgId: null,
                        regisNo: _regisNo,
                      ),
                    );

                    // controller
                    //     .register(
                    //         UserObject(
                    //           _name: _name,
                    //           _address: _address,
                    //           city: _cityValue,
                    //           email: email,
                    //           _volId: _volId,
                    //           _profileImage: null,
                    //           isVol: _isVolunteer,
                    //           _idPhoto: null,
                    //           _phone: _phone,
                    //           orgId: _selectedNgo != null
                    //               ? _selectedNgo.staticId
                    //               : null,
                    //           _regisNo: _regisNo,
                    //         ),
                    //         userType)
                    //     .whenComplete(() => _navigateToRootApp(context));
                    _navigateToRootApp(context);
                  }
                },
                textOnButton: Constants.REGISTER_TEXT,
                color: Styles.buttonColor2,
              ),
            );
          }
        }),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildProfilePhoto() {
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
                    fit: BoxFit.cover,
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

  Widget _buildCSCPicker(DarkThemeProvider darkThemeProvider) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color:
          darkThemeProvider.darkTheme ? Styles.black2 : Styles.textFieldColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: CSCPicker(
          showStates: true,
          showCities: true,
          layout: Layout.vertical,
          flagState: CountryFlag.ENABLE,
          onCountryChanged: (value) {
            setState(() {
              // _countryValue = value;
            });
          },
          onStateChanged: (value) {
            setState(() {
              // _stateValue = value;
            });
          },
          onCityChanged: (value) {
            setState(() {
              _cityValue = value;
            });
          },
        ),
      ),
    );
  }

  Widget _buildVolunteerFields(DarkThemeProvider darkThemeProvider) {
    return _userType == USERTYPE.INDIVIDUAL || _userType == USERTYPE.VOLUNTEER
        ? Column(
            children: [
              CheckboxListTile(
                onChanged: (bool value) {
                  Provider.of<AppUserController>(context, listen: false)
                      .setUsertype(value == true
                          ? USERTYPE.VOLUNTEER
                          : USERTYPE.INDIVIDUAL);
                  setState(() {
                    _isVolunteer = value;
                  });
                },
                value: _isVolunteer,
                title: Text('I am a volunteer',
                    style: Theme.of(context).textTheme.bodyText2),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              Visibility(
                visible: _isVolunteer,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: DropdownButtonHideUnderline(
                        child: Card(
                          elevation: 0.0,
                          color: darkThemeProvider.darkTheme
                              ? Styles.black2
                              : Styles.textFieldColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: DropdownButton<Ngo>(
                            hint: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text('Select organisation',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ),
                            isExpanded: true,
                            elevation: 2,
                            itemHeight: 56,
                            value: _selectedNgo,
                            onChanged: (Ngo ngo) {
                              setState(() {
                                _selectedNgo = ngo;
                              });
                            },
                            items: ngoList.map((Ngo ngo) {
                              return DropdownMenuItem<Ngo>(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(18, 16, 0, 16),
                                  child: new Text(
                                    ngo.name,
                                    overflow: TextOverflow.clip,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                value: ngo,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    CustomTextField(
                      onSaved: (value) {
                        _volId = value;
                      },
                      hintText: 'Identification number',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return _validate(value, true);
                      },
                    )
                  ],
                ),
              )
            ],
          )
        : Container();
  }

  Widget _buildNgoFields() {
    return _userType == USERTYPE.NGO
        ? Column(
            children: [
              CustomTextField(
                onSaved: (value) {
                  _regisNo = value;
                },
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
              _idProofImg != null
                  ? Image.file(
                      _idProofImg,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    )
                  : Container()
            ],
          )
        : Container();
  }
}
