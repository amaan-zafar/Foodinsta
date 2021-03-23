import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:food_insta/components/custom_button.dart';
import 'package:food_insta/components/custom_dropdown.dart';
import 'package:food_insta/components/custom_textfield.dart';
import 'package:food_insta/components/slide_top_route.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/components/page_indicator.dart' as Indicator;
import 'package:food_insta/screens/registration/user_type.dart';
import 'package:food_insta/theme.dart' as AppTheme;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  int currentPage = 0;
  int numberOfPages = 2;
  bool isExistingUser = false;
  bool didServerSendCode = false;
  String verificationId;
  List<String> _countryCodes = [];
  bool showError = false;
  String smsCode;

  User user = User(countryCode: '+91');
  String phoneNumberWithCountryCode;
  final _phoneKey = GlobalKey<FormState>();
  final _otpFormKey = GlobalKey<FormState>();

  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    Constants.COUNTRY_CODES_JSON
        .forEach((i) => {_countryCodes.add(i['dial_code'].toString())});
    super.initState();
  }

  String validatePhone(String value) {
    int phone = int.tryParse(value);
    if (value.length != 10 || phone == null)
      return 'Invalid Phone Number';
    else
      return null;
  }

  Widget _buildPhoneNumberPage() {
    return Form(
      key: _phoneKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 18,
            ),
            Text(
              'Log in to your account',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 86,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomDropDown(
                    itemHeight: 56,
                    list: _countryCodes,
                    onChanged: (newValue) {
                      setState(() {
                        // user.countryCode = newValue;
                      });
                    },
                    value: user.countryCode,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: CustomTextField(
                      keyboardType: TextInputType.number,
                      hintText: 'Phone Number',
                      validator: validatePhone,
                      onChanged: (value) {
                        if (value != null && value.length == 10) {
                          setState(() {
                            // user.phoneNumber = value;
                            // this.phoneNumberWithCountryCode =
                            //     '${user.countryCode}' + '${user.phoneNumber}';
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomButton(
              textOnButton: 'Get OTP',
              onPressed: () async {
                // validate phone number
                if (_phoneKey.currentState.validate()) {
                  this.phoneNumberWithCountryCode =
                      '${user.countryCode}' + '${user.phoneNumber}';
                  // signout user if its already signin
                  pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOtpPage() {
    return WillPopScope(
      onWillPop: () => pageController.previousPage(
          duration: Duration(milliseconds: 500), curve: Curves.ease),
      child: Form(
        key: _otpFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 18,
              ),
              Text(
                'Enter the OTP',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                width: MediaQuery.of(context).size.width,
                child: VerificationCode(
                  textStyle: showError
                      ? TextStyle(
                          fontSize: 20.0, color: Theme.of(context).errorColor)
                      : TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColorDark),
                  keyboardType: TextInputType.number,
                  length: 4,
                  onCompleted: (String value) {
                    setState(() {
                      this.smsCode = value;
                    });
                  },
                  onEditing: (val) {
                    print("onEditing");
                  },
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, right: 8.0),
                child: CustomButton(
                  textOnButton: 'Verify the OTP',
                  onPressed: () async {
                    showError = false;
                    if (this.smsCode == null || this.smsCode.length != 4) {
                      setState(() {
                        print('show error');
                        showError = true;
                      });
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserTypePage()));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool loaderForPhonePage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
