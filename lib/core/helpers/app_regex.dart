class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(password);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  }

  static String removeHtmlTags(String text) {
    final pattern = RegExp(
        r'(<p>|</p>|<br>|</br>|</i>|<i>|<b>|</b>|<span>|</span>|</a>|<div>|</div>|<p style=\"color:rgb\(32,33,34\);font-family:sans-serif;\">|<a href=\"https://en.wikipedia.org/wiki/Coffee\" title=\"Coffee\">|<span style="font-size:10px;">|)');
    return text.replaceAll(pattern, '');
  }
}
