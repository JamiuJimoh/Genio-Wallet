import 'package:flutter/material.dart';

import 'package:genio_wallet/app/home/home_page.dart';
import 'package:country_picker/country_picker.dart';
import 'package:genio_wallet/app/shared_widgets/custom_dialog.dart';
import 'package:genio_wallet/app/shared_widgets/http_exception.dart';
import 'package:genio_wallet/app/sign_in/email_sign_in/validators.dart';
import 'package:provider/provider.dart';
import '../../../app_colors.dart';
import '../../shared_widgets/custom_text_field.dart';
import 'auth_provider.dart';
import 'sign_in_button.dart';

class EmailSignInPage extends StatefulWidget with SignInValidators {
  EmailSignInPage({Key? key}) : super(key: key);

  // static Future<Widget> show(BuildContext context)async{
  //   // return await Navigator
  // }

  @override
  State<EmailSignInPage> createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  var _authType = AuthType.logIn;
  var _accountType = AccountType.personal;
  var _termsAccepted = false;
  var _dataUsage = false;
  var _seePassword = false;
  var _seeConfirmPassword = false;

  Country? _country;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    print('Select country: ${_country?.countryCode}');
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_authType == AuthType.signUp)
                          _DropdownContainer(
                            child: DropdownButton<AccountType>(
                              hint: const Text('Account Type'),
                              value: _accountType,
                              style: Theme.of(context).textTheme.bodyText1,
                              isExpanded: true,
                              items: const [
                                DropdownMenuItem(
                                  child: Text('Personal'),
                                  value: AccountType.personal,
                                ),
                                DropdownMenuItem(
                                  child: Text('Business'),
                                  value: AccountType.business,
                                ),
                              ],
                              onChanged: (acc) {
                                if (acc == null) return;
                                setState(() {
                                  _accountType = acc;
                                });
                              },
                            ),
                          ),
                        if (_authType == AuthType.signUp) ...[
                          const SizedBox(height: 15.0),
                          CustomTextField(
                            label: 'First Name',
                            onSaved: (fn) => auth.updateWith(firstName: fn),
                            icon: const Icon(
                              Icons.person,
                              color: AppColors.kSecondaryColor,
                            ),
                            validator: (val) =>
                                widget.nameValidator.isValid(val!)
                                    ? null
                                    : SignInValidators.invalidNameErrorText,
                          ),
                        ],
                        if (_authType == AuthType.signUp) ...[
                          const SizedBox(height: 15.0),
                          CustomTextField(
                            label: 'Last Name',
                            onSaved: (ln) => auth.updateWith(lastName: ln),
                            icon: const Icon(
                              Icons.person,
                              color: AppColors.kSecondaryColor,
                            ),
                            validator: (val) =>
                                widget.nameValidator.isValid(val!)
                                    ? null
                                    : SignInValidators.invalidNameErrorText,
                          ),
                        ],
                        const SizedBox(height: 15.0),
                        CustomTextField(
                          label: 'Email',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (e) => auth.updateWith(email: e),
                          icon: const Icon(
                            Icons.mail,
                            color: AppColors.kSecondaryColor,
                          ),
                          validator: (val) =>
                              widget.emailValidator.isValidEmail(val!)
                                  ? null
                                  : SignInValidators.invalidEmailErrorText,
                        ),
                        const SizedBox(height: 15.0),
                        CustomTextField(
                          label: 'Password',
                          controller: _passwordController,
                          obscureText: !_seePassword,
                          onSaved: (p) => auth.updateWith(password: p),
                          icon: const Icon(
                            Icons.password,
                            color: AppColors.kSecondaryColor,
                          ),
                          validator: (val) {
                            if (val != null) {
                              if (val.isNotEmpty &&
                                  val.length >= 8 &&
                                  val.length <= 64) {
                                return null;
                              }
                            }
                            return _authType == AuthType.logIn
                                ? 'Invalid password'
                                : SignInValidators.invalidPasswordErrorText;
                          },
                          suffixIcon: IconButton(
                            onPressed: () =>
                                setState(() => _seePassword = !_seePassword),
                            icon: Icon(_seePassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: AppColors.kSecondaryColor,
                          ),
                        ),
                        if (_authType == AuthType.signUp) ...[
                          const SizedBox(height: 15.0),
                          CustomTextField(
                            label: 'Confirm Password',
                            controller: _confirmPasswordController,
                            obscureText: !_seeConfirmPassword,
                            icon: const Icon(
                              Icons.password,
                              color: AppColors.kSecondaryColor,
                            ),
                            onSaved: (cp) =>
                                auth.updateWith(confirmPassword: cp),
                            validator: (val) {
                              if (val != null) {
                                if (val == _passwordController.text) {
                                  return null;
                                }
                              }
                              return SignInValidators
                                  .invalidConfirmPasswordErrorText;
                            },
                            suffixIcon: IconButton(
                              onPressed: () => setState(() =>
                                  _seeConfirmPassword = !_seeConfirmPassword),
                              icon: Icon(_seeConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: AppColors.kSecondaryColor,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          GestureDetector(
                            onTap: _showCountryPicker,
                            child: _DropdownContainer(
                              child: Text(
                                _country?.displayNameNoCountryCode ??
                                    'Choose country',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          CheckboxListTile(
                            contentPadding: const EdgeInsets.all(0.0),
                            activeColor: AppColors.kSecondaryColor,
                            value: _termsAccepted,
                            onChanged: (val) {
                              if (val == null) return;
                              setState(() {
                                _termsAccepted = val;
                              });
                            },
                            // selected: ,
                            title: Text(
                              'Accepted Terms',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                                'Agreements collected from the user, such as acceptance of terms and conditions, or opt in for marketing.',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                          const SizedBox(height: 15.0),
                          CheckboxListTile(
                            activeColor: AppColors.kSecondaryColor,
                            contentPadding: const EdgeInsets.all(0.0),
                            value: _dataUsage,
                            onChanged: (val) {
                              if (val == null) return;
                              setState(() {
                                _dataUsage = val;
                              });
                            },
                            title: Text(
                              'Agreed to Data Usage',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                                'Consent to us using the provided data, including consent for us to verify the identity of relevant individuals with our service providers and database owners in accordance with the Identity Verification Terms.',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                        const SizedBox(height: 25.0),
                        SignInButton(
                          context: context,
                          isLoading: auth.isLoading,
                          text: _authType == AuthType.logIn
                              ? 'Log In'
                              : 'Sign Up',
                          onPressed: () => _authenticate(auth),
                        ),
                        const SizedBox(height: 25.0),
                        InkWell(
                          onTap: () {
                            if (_authType == AuthType.logIn) {
                              setState(() {
                                _authType = AuthType.signUp;
                              });
                            } else {
                              setState(() {
                                _authType = AuthType.logIn;
                              });
                            }
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: _authType == AuthType.logIn
                                        ? 'Don\'t have an account? '
                                        : 'Already have an account? ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                        )),
                                TextSpan(
                                  text: _authType == AuthType.logIn
                                      ? ' REGISTER'
                                      : 'Log In',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: AppColors.kAccentColor),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _authenticate(AuthProvider auth) async {
    if (_authType == AuthType.logIn) {
     
      if (widget.emailValidator.isValid(_emailController.text)) {
        try {
          final response = await auth.login(
            email: _emailController.text,
            password: _passwordController.text,
          );
          final o = await CustomDialog.showAlertDialog(
            context: context,
            title: response,
            content: response,
            defaultActionText: 'OK',
          );
        } on HttpException catch (e) {
          CustomDialog.showAlertDialog(
              context: context,
              title: e.title,
              content: e.message,
              defaultActionText: 'Cancel');
        } catch (e) {
          CustomDialog.showAlertDialog(
              context: context,
              title: 'An Error Occurred',
              content: e.toString(),
              defaultActionText: 'Cancel');
        }
      }
    } else {
      _showSnackbar();
      if (!_validateAndSaveForm() && _authType == AuthType.signUp) return;
      if ((_country == null || !_termsAccepted || !_dataUsage) &&
          _authType == AuthType.signUp) return;
      try {
        final response = await auth.signUp(
          authType: _authType,
          country: _country!,
          termsAccepted: _termsAccepted,
          dataUsage: _dataUsage,
        );
        final o = await CustomDialog.showAlertDialog(
          context: context,
          title: response,
          content:
              'Please check your email for the verification mail. Verify and complete your KYC registration',
          defaultActionText: 'OK',
        );
        if (o == null) return;
        if (o) _authType = AuthType.logIn;
      } on HttpException catch (e) {
        CustomDialog.showAlertDialog(
            context: context,
            title: e.title,
            content: e.message,
            defaultActionText: 'Cancel');
      } catch (e) {
        CustomDialog.showAlertDialog(
            context: context,
            title: 'An Error Occurred',
            content: e.toString(),
            defaultActionText: 'Cancel');
      }
    }
  }

  void _showSnackbar() {
    if (_authType == AuthType.logIn) return;
    if (_country != null && _dataUsage && _termsAccepted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.warning, color: Theme.of(context).colorScheme.error),
            const SizedBox(width: 10.0),
            Text(
                _country == null
                    ? 'Please select your country'
                    : 'Please accept terms and agreement.',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
        // action: SnackBarAction(),
      ),
    );
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: Colors.white,
        textStyle: Theme.of(context).textTheme.subtitle1,
        //Optional. Sets the border radius for the bottomsheet.
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        //Optional. Styles the search field.
        inputDecoration: InputDecoration(
          label: Text(
            'Search',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          hintText: 'Start typing to search',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: AppColors.kSecondaryColor),
          ),
          prefixIcon:
              const Icon(Icons.search, color: AppColors.kSubtitleTextColor),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: AppColors.kSecondaryColor),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: AppColors.kSecondaryColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: AppColors.kSecondaryColor),
          ),
        ),
      ),
      onSelect: (Country country) => setState(() => _country = country),
    );
  }
}

class _DropdownContainer extends StatelessWidget {
  final Widget child;
  const _DropdownContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kSecondaryColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: child,
    );
  }
}

/*

  AuthType _authType = AuthType.logIn;
child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CustomTextField(
                          label: 'Email', icon: Icon(Icons.mail)),
                      const SizedBox(height: 15.0),
                      const CustomTextField(
                          label: 'Password', icon: Icon(Icons.password)),
                      if (_authType == AuthType.signUp) ...[
                        const SizedBox(height: 15.0),
                        const CustomTextField(
                            label: 'Confirm Password',
                            icon: Icon(Icons.password)),
                      ],
                      const SizedBox(height: 25.0),
                      SignInButton(
                        context: context,
                        text: _authType == AuthType.logIn
                            ? 'Log In'
                            : 'Sign Up',
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const HomePage()),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      InkWell(
                        onTap: () {
                          if (_authType == AuthType.logIn) {
                            setState(() {
                              _authType = AuthType.signUp;
                            });
                          } else {
                            setState(() {
                              _authType = AuthType.logIn;
                            });
                          }
                        },
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text: _authType == AuthType.logIn
                                    ? 'Don\'t have an account? '
                                    : 'Already have an account? ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    )),
                            TextSpan(
                              text: _authType == AuthType.logIn
                                  ? ' REGISTER'
                                  : 'Log In',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: AppColors.kAccentColor),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

*/