abstract class StringValidator {
  bool isValid(String value);
  bool isValidEmail(String value);
  bool isValidPassword(String value);
  bool confirmPasswordMatch(String password, String confirmPassword);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty && value.length <= 50;
  }

  @override
  bool isValidEmail(String value) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  @override
  bool isValidPassword(String value) {
    print(value.length >= 8);
    return value.length >= 8 && value.length <= 64;
  }

  @override
  bool confirmPasswordMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}

mixin SignInValidators {
  final StringValidator nameValidator = NonEmptyStringValidator();
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final StringValidator confirmPasswordValidator = NonEmptyStringValidator();

  static const String invalidNameErrorText = 'Cannot be empty';
  static const String invalidEmailErrorText = 'Email is invalid';
  static const String invalidPasswordErrorText =
      'Password must be at least 8 characters long';
  static const String invalidConfirmPasswordErrorText = 'Password must match ';
}
