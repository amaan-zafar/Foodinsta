import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_button.dart';
import 'package:food_insta/components/custom_dropdown.dart';
import 'package:food_insta/components/custom_textfield.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/models/user.dart';
import 'package:food_insta/utils.dart';

class RegisterationPage extends StatefulWidget {
  final int userType;
  const RegisterationPage({Key key, @required this.userType}) : super(key: key);
  @override
  _RegisterUserState createState() => _RegisterUserState(userType);
}

class _RegisterUserState extends State<RegisterationPage> {
  final int userType;
  _RegisterUserState(this.userType);

  bool isChecked = false;
  List<String> _states = Constants.STATE_CITY_JSON.keys.toList();
  String _selectedState = 'Assam';
  List<String> _cities = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _selectedState = _states[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(Constants.APP_LABEL),
          ),
          // leading: Container(),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              buildForm(userType),
              Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 4.0, 32.0, 16.0),
                child: CustomButton(
                  textOnButton: Constants.REGISTER_TEXT,
                  onPressed: isChecked ? () {} : () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _validate(String value, bool isRequired) {
    if (value.isEmpty && isRequired) return Constants.ERR_EMPTY_FIELD;
    return null;
  }

  Widget buildForm(int userType) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: 24),
              Text(
                'Fill ${Utils.getMemberType(userType)} details',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 24,
              ),
              CustomTextField(
                keyboardType: TextInputType.name,
                labelText: Constants.NAME_TEXT,
                validator: (value) {
                  return _validate(value, true);
                },
              ),
              SizedBox(height: 24),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                labelText:
                    '${Constants.EMAIL_TEXT} (${Constants.OPTIONAL_TEXT})',
                validator: (value) {
                  return _validate(value, false);
                },
              ),
              SizedBox(height: 24),
              CustomDropDown(
                list: _states,
                value: _selectedState,
                onChanged: null,
              ),
              SizedBox(height: 24),
              CustomDropDown(
                list: _states,
                value: _selectedState,
                onChanged: null,
              ),
              SizedBox(height: 24),
              userType == 1
                  ? CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      labelText: Constants.REGISTERATION_NUMBER_TEXT,
                      validator: (value) {
                        return _validate(value, true);
                      },
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomTextField(
                            keyboardType: TextInputType.number,
                            labelText: Constants.STD_CODE,
                            validator: (value) {
                              return _validate(value, false);
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 3,
                          child: CustomTextField(
                            keyboardType: TextInputType.number,
                            labelText:
                                '${Constants.LANDLINE_TEXT} (${Constants.OPTIONAL_TEXT})',
                            validator: (value) {
                              return _validate(value, false);
                            },
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 24),
              CustomTextField(
                keyboardType: TextInputType.multiline,
                labelText: Constants.STREET_ADDRESS,
                validator: (value) {
                  return _validate(value, true);
                },
              ),
              SizedBox(height: 24),
              userType == 2
                  ? CustomTextField(
                      keyboardType: TextInputType.text,
                      labelText:
                          '${Constants.WEBSITE_TEXT} (${Constants.OPTIONAL_TEXT})',
                      validator: (value) {
                        return _validate(value, false);
                      },
                    )
                  : Container(),
              CheckboxListTile(
                title: Text(Constants.ACEEPT_TNC),
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
        ),
      ),
    );
  }
}
