class  Validation{
  static bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(value);
  }

  static bool validateMobile(String value) {
    Pattern pattern = r'^[6-9]\d{9}$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(value);
  }

  static bool isEmptyString(String value) {
    Pattern pattern = r'^$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(value);
  }


}