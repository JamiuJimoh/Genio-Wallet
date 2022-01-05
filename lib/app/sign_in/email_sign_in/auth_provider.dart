import 'dart:convert';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:genio_wallet/app/shared_widgets/http_exception.dart';
import 'package:http/http.dart' as http;

import 'package:genio_wallet/app/sign_in/email_sign_in/validators.dart';

enum AccountType { personal, business }

enum AuthType { signUp, logIn }

const baseURL = 'https://geniopay.com/api/v1.0/';

class AuthProvider with ChangeNotifier {
  AccountType accountType;
  String firstName;
  String lastName;
  String email;
  String password;
  String confirmPassword;
  Country? country;
  bool termsAccepted;
  bool dataUsage;

  AuthProvider({
    this.accountType = AccountType.personal,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.country,
    this.termsAccepted = false,
    this.dataUsage = false,
  });

  var detail = '';
  var errTitle = '';
  var errMessage = '';
  var isLoading = false;

  @override
  String toString() {
    return 'account type - $accountType, firstName - $firstName, lastName - $lastName, email - $email, password - $password, confirm password - $confirmPassword, country - $country, terms accepted, $termsAccepted, data usage - $dataUsage';
  }

  Future<String> submit({
    required Country? country,
    required bool termsAccepted,
    required bool dataUsage,
    required AuthType authType,
  }) async {
    updateWith(
        country: country, termsAccepted: termsAccepted, dataUsage: dataUsage);

    const signUpURL = 'https://geniopay.com/api/v1.0/profiles/register/';
    try {
      if (authType == AuthType.signUp) {
        return await _signUp(country!.countryCode);
      } else {
        return await _login();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
    // ;
  }

  Future<String> _login() async {
    try {
      isLoading = true;
      notifyListeners();
      final response = await http.post(
          Uri.parse('https://geniopay.com/api/v1.0/accounts/login/'),
          headers: {'content-type': 'application/json; charset=utf-8'},
          body: json.encode({
            'email': email,
            'password': password,
          }));
      final body = json.decode(response.body);

      print(body);

      isLoading = false;
      notifyListeners();
      return '';
    } catch (e) {
      isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<String> _signUp(String countryCode) async {
    try {
      isLoading = true;
      notifyListeners();
      final response = await http.post(
          Uri.parse('https://geniopay.com/api/v1.0/profiles/register/'),
          headers: {'content-type': 'application/json; charset=utf-8'},
          body: json.encode({
            'account_type':
                accountType == AccountType.personal ? 'PERSONAL' : 'BUSINESS',
            'first_name': firstName,
            'last_name': lastName,
            'email': email,
            'password': password,
            'country': countryCode,
            'accept_terms': termsAccepted,
            'agreed_to_data_usage': dataUsage,
          }));

      final body = json.decode(response.body);

      print(response.statusCode);
      // print(body['errors'][0]['message']);
      if (body['errors'] != null) {
        throw HttpException(
            title: body['message'], message: body['errors'][0]['message']);
      }
      detail = body['detail'];

      isLoading = false;
      notifyListeners();
      return body['detail'];
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e);
      rethrow;
    }
  }

  void updateWith({
    AccountType? accountType,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    Country? country,
    bool? termsAccepted,
    bool? dataUsage,
  }) {
    this.accountType = accountType ?? this.accountType;
    this.firstName = firstName ?? this.firstName;
    this.lastName = lastName ?? this.lastName;
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.confirmPassword = confirmPassword ?? this.confirmPassword;
    this.country = country ?? this.country;
    this.termsAccepted = termsAccepted ?? this.termsAccepted;
    this.dataUsage = dataUsage ?? this.dataUsage;

    notifyListeners();
  }
}
