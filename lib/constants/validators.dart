
class Validators {
  static String? validateEmail(String? value) {
    if (value!.length < 12 || value.length > 35) {
      return "Email must be between 12 and 35 characters.";
    }
    if (!value.endsWith("@gmail.com")) {
      return "Please enter a valid email address.";
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value!.length < 4 || value.length > 30) {
      return "Username must be between 4 and 30 characters.";
    }
    return null;
  }
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password cannot be empty.";
    }
    if (value.length < 8 || value.length > 20) {
      return "Password must be between 8 and 20 characters.";
    }
    if (!RegExp(
            r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]+$')
        .hasMatch(value)) {
      return "Password must contain at least one letter, one number, and one special character.";
    }
    return null;
  }
}
