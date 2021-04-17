import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/bloc/login/login.dart';
import 'package:flutter_bloc_architecture/src/constants/font_constants.dart';
import 'package:flutter_bloc_architecture/src/constants/page_route_constants.dart';
import 'package:flutter_bloc_architecture/src/constants/string_constant.dart';
import 'package:flutter_bloc_architecture/src/models/local_data_models/login_user_details.dart';
import 'package:flutter_bloc_architecture/src/resources/app_colors.dart';
import 'package:flutter_bloc_architecture/src/resources/dimens.dart';
import 'package:flutter_bloc_architecture/src/resources/text_styles.dart';
import 'package:flutter_bloc_architecture/src/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter_bloc_architecture/src/utils/helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  LoginBloc loginBloc;
  final loginUserDetails = LoginUserDetails();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final progressKey = GlobalKey();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return new Scaffold(
            backgroundColor: AppColors.white,
            key: _scaffoldKey,
            resizeToAvoidBottomPadding: true,
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                height: size.height,
                width: size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: kBottomNavigationBarHeight,
                      ),
                      Container(
                        width: Dimens.px150,
                        height: Dimens.px150,
                        child: Image.asset(
                          'assets/images/logo.png',
                        ),
                      ),
                      Text(StringConstant.sign_in,
                          style: AppTextStyles.getLargeText(
                              size.width, AppColors.black, FontConstant.kBold)),
                      Container(
                        width: size.width * 0.85,
                        child: Column(
                          children: <Widget>[
                            _email(state, size),
                            SizedBox(height: size.height * .03),
                            _password(state, size),
                            SizedBox(height: size.height * .03),
                            _submitButton(size, state)
                          ],
                        ),
                      )
                    ]),
              ),
            ));
      },
    );
  }

  _onEmailChanged() {
    loginUserDetails.userEmail = _emailController.text;
    if (loginUserDetails.userEmail.isNotEmpty) {
      loginBloc.add(EmailChanged(
        email: _emailController.text,
      ));
    }
  }

  _onPasswordChanged() {
    loginUserDetails.password = _passwordController.text;
    if (loginUserDetails.password.isNotEmpty) {
      loginBloc.add(PasswordChanged(
        password: _passwordController.text,
      ));
    }
  }

  Widget _email(LoginState loginState, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          StringConstant.email,
          style: AppTextStyles.getMediumText(
              size.width, AppColors.black, FontConstant.kBold),
        ),
        SizedBox(
          height: Dimens.px8,
        ),
        CustomTextField(
          hint: StringConstant.type_email,
          obscureText: false,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          errorText: StringConstant.please_enter_email_address,
          textEditingController: _emailController,
          currentFocusNode: _emailFocus,
          isFocused: loginUserDetails.userEmail != null &&
                  loginUserDetails.userEmail.isNotEmpty
              ? true
              : false,
          validator: (_) {
            return (loginUserDetails.userEmail == null ||
                        loginUserDetails.userEmail.isEmpty) ||
                    loginState.isEmailValid
                ? null
                : StringConstant.invalid_user_name;
          },
        )
      ],
    );
  }

  Widget _password(LoginState loginState, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          StringConstant.password,
          style: AppTextStyles.getMediumText(
              size.width, AppColors.black, FontConstant.kBold),
        ),
        SizedBox(
          height: Dimens.px8,
        ),
        CustomTextField(
          hint: StringConstant.password_hint,
          obscureText: true,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          errorText: StringConstant.invalid_password,
          textEditingController: _passwordController,
          currentFocusNode: _passwordFocus,
          isFocused: loginUserDetails.password != null &&
                  loginUserDetails.password.isNotEmpty
              ? true
              : false,
          validator: (_) {
            return (loginUserDetails.password == null ||
                        loginUserDetails.password.isEmpty) ||
                    loginState.isPasswordValid
                ? null
                : StringConstant.invalid_password;
          },
        )
      ],
    );
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
      backgroundColor: AppColors.black,
    ));
  }

  Widget _submitButton(Size size, LoginState state) {
    return Container(
      width: size.width,
      height: kBottomNavigationBarHeight,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is UserLoggedIn) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                PageRouteConstants.home_screen,
                (Route<dynamic> route) => false);
          } else if (state is LoginFailure) {
           /* Helper.showAlert(context, StringConstant.error_message,
                StringConstant.invalid_user_credentials);*/
            Navigator.of(context).pushNamedAndRemoveUntil(
                PageRouteConstants.home_screen,
                    (Route<dynamic> route) => false);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return Helper.progressWidget(progressKey);
            } else {
              return RaisedButton(
                child: Text(
                  StringConstant.sign_in,
                  style: AppTextStyles.getMediumText(
                      size.width, AppColors.white, FontConstant.kSemiBold),
                ),
                onPressed: () {
                  if (!(_emailController.text.length > 0) ||
                      !state.isEmailValid) {
                    showInSnackBar(StringConstant.invalid_email);
                  } else if (!(_passwordController.text.length > 0) ||
                      !state.isPasswordValid) {
                    showInSnackBar(StringConstant.invalid_password);
                  } else {
                    Helper.checkConnectivity().then((internetStatus) {
                      if (internetStatus) {
                        if (progressKey.currentWidget == null) {
                          BlocProvider.of<LoginBloc>(context).add(
                            SignInUser(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        }
                      } else {
                        Helper.showAlert(context, StringConstant.internet_alert,
                            StringConstant.please_check_internet_connectivity);
                      }
                    });
                  }
                },
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.px28),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }
}
