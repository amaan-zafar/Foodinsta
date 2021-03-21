import 'package:food_insta/constants.dart' as Constants;

class Utils {
  String getCountryFromCode(String code) {
    String country = '';
    Constants.COUNTRY_CODES_JSON.forEach((i) => {
          if (i['dial_code'] == code) {country = i['name']}
        });
    return country;
  }

  static String getMemberType(int index) {
    switch (index) {
      case 0:
        return 'NGO';
      case 1:
        return 'Business';
      case 2:
        return 'Individual';
      default:
        return 'Individual';
    }
  }
}
