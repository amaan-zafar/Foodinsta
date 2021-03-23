import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_button.dart';
import 'package:food_insta/components/custom_dropdown.dart';
import 'package:food_insta/components/custom_scaffold.dart';
import 'package:food_insta/components/custom_textfield.dart';
import 'package:food_insta/theme.dart' as AppTheme;
import 'package:food_insta/constants.dart' as Constants;

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  int userType = 0;

  bool isChecked = false;

  List<String> _states = Constants.STATE_CITY_JSON.keys.toList();

  String _selectedState = 'Assam';

  List<String> _cities = [];

  final _formKey = GlobalKey<FormState>();

  String _validate(String value, bool isRequired) {
    if (value.isEmpty && isRequired) return Constants.ERR_EMPTY_FIELD;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      children: [
        SizedBox(height: 16),
        Text(
          'Final step, fill out your details',
          style: Theme.of(context).textTheme.headline6,
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
          hintText: '${Constants.EMAIL_TEXT} (${Constants.OPTIONAL_TEXT})',
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
          title: Text(Constants.ACEEPT_TNC),
          value: isChecked,
          onChanged: (newValue) {
            // setState(() {
            //   isChecked = newValue;
            // });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        SizedBox(height: 16),
        CustomButton(
          onPressed: () {},
          textOnButton: Constants.REGISTER_TEXT,
          color: AppTheme.customButtonColor,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
