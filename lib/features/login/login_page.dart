import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:poker/core/common/common_bg_page.dart';
import 'package:poker/core/common/common_button_widget.dart';
import 'package:poker/core/common/common_text_widget.dart';
import 'package:poker/core/common/common_textfield.dart';
import 'package:poker/core/common/context_extension.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/services/provider/provider.dart';
import 'package:poker/core/utils/AppConstants.dart';
import 'package:poker/core/utils/PreferenceHelper.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/core/utils/app_constants.dart';
import 'package:poker/core/utils/app_utils.dart';
import 'package:poker/core/utils/image_path.dart';
import 'package:poker/core/utils/login_with_google.dart';
import 'package:poker/core/utils/string_utils.dart';
import 'package:poker/core/utils/validation.dart';
import 'package:poker/features/login/Resource.dart';
import 'package:poker/features/login/model/login_model.dart';
import 'package:poker/features/signup/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  Map<String, dynamic>? _userData;
  bool _loggedIn = false;
  String _name = "You're not logged in";
  bool obscureText = true;
  String redirectUrl = 'https://www.youtube.com/callback';
  String clientId = '776rnw4e4izlvg';
  String clientSecret = 'rQEgboUHMLcQi59v';
  UserObject? user;
  bool logoutUser = false;

  bool isLoading = false;

  TextEditingController tetEmail = TextEditingController();
  TextEditingController tetPassword = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 //   tetEmail.clear();
    tetEmail.text="sameer@gmail.com";
    tetPassword.text="India@123";
  }

  @override
  Widget build(BuildContext context) {
    return  CommonBgPage(
      isLogin: true,
      imagePath: icBackground,
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              margin: AppUtils.commonAllEdgeInsets(
                  left: AppConstants.twenty, right: AppConstants.twenty),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppUtils.commonSizedBox(
                      height: AppConstants.thirtyFive,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AppUtils.commonImageAssetWidget(
                          path: icLogo,
                          height: AppConstants.eightyFour,
                          width: AppConstants.oneHundredTwentyTwo),
                    ),
                    CommonTextWidget(
                      text: StringUtils.login,
                      fontWeight: FontWeight.w700,
                      margintop: AppConstants.fortyFive,
                      fontSize: AppConstants.twenty,
                    ),
                    CommonTextWidget(
                      text: StringUtils.email,
                      margintop: AppConstants.thirtyFive,
                    ),
                    CommonTextField(
                        controller: tetEmail,
                        inputTypes: TextInputType.emailAddress,
                        marginTop: AppConstants.ten,
                        hint: StringUtils.emailHint,
                        iconWidget: const Icon(
                          Icons.email_outlined,
                          color: AppColor.colorWhite,
                        ),
                        fontSize: AppConstants.fourteen,
                        fontWeight: FontWeight.w500,
                        radius: AppConstants.eight),
                    CommonTextWidget(
                        text: StringUtils.password,
                        margintop: AppConstants.eighteen),
                    CommonTextField(
                        controller: tetPassword,
                        obscureText: obscureText,
                        suffixIcon: AppUtils.commonInkWell(
                            child: !obscureText
                                ? AppUtils.commonIcon(
                                    icon: Icons.visibility,
                                  )
                                : AppUtils.commonIcon(
                                    icon: Icons.visibility_off,
                                  ),
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            }),
                        inputTypes: TextInputType.visiblePassword,
                        marginTop: AppConstants.ten,
                        hint: StringUtils.password,
                        iconWidget: const Icon(
                          Icons.lock_outline,
                          color: AppColor.colorWhite,
                        ),
                        fontSize: AppConstants.fourteen,
                        fontWeight: FontWeight.w500,
                        radius: AppConstants.eight),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AppUtils.commonInkWell(
                        onTap: onClickForgot,
                        child: CommonTextWidget(
                            textDecoration: TextDecoration.underline,
                            text: StringUtils.forgotPassword,
                            margintop: AppConstants.twenty),
                      ),
                    ),
                    CommonButtonWidget(
                        text: StringUtils.login,
                        onPressed: onClickLogin,
                        marginTop: AppConstants.twentyFour),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: AppConstants.thirtyFive),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppUtils.commonSizedBox(
                            width: AppConstants.ninetySeven,
                            child: Divider(
                                color: AppColor.colorWhiteLight,
                                height: AppConstants.two,
                                thickness: AppConstants.two),
                          ),
                          CommonTextWidget(
                              left: AppConstants.ten,
                              right: AppConstants.ten,
                              text: StringUtils.connectWith.toCapitalize()),
                          Expanded(
                            child: AppUtils.commonSizedBox(
                              width: AppConstants.ninetySeven,
                              child: Divider(
                                  color: AppColor.colorWhiteLight,
                                  height: AppConstants.two,
                                  thickness: AppConstants.two),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        commonButton(
                            top: AppConstants.sixteen,
                            path: icFacebook,
                            onTap: () {
                              _login();
                            }),
                        commonButton(
                            left: AppConstants.sixteen,
                            top: AppConstants.sixteen,
                            path: icGoogle,
                            onTap: () {
                              signInWithGoogle().then((result){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const SignupPage();
                                    },
                                  ),
                                );
                              });
                             // signInWithGoogle();
                            }),
                        commonButton(
                            left: AppConstants.sixteen,
                            top: AppConstants.sixteen,
                            path: icLinkedin,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (final BuildContext context) =>
                                      LinkedInUserWidget(
                                    appBar: AppBar(
                                      title: const Text('OAuth User'),
                                    ),
                                    destroySession: logoutUser,
                                    redirectUrl: redirectUrl,
                                    clientId: clientId,
                                    clientSecret: clientSecret,
                                    projection: const [
                                      ProjectionParameters.id,
                                      ProjectionParameters.localizedFirstName,
                                      ProjectionParameters.localizedLastName,
                                      ProjectionParameters.firstName,
                                      ProjectionParameters.lastName,
                                      ProjectionParameters.profilePicture,
                                    ],
                                    onError: (final UserFailedAction e) {
                                      print('Error: ${e.toString()}');
                                      print('Error: ${e.stackTrace.toString()}');
                                    },
                                    onGetUserProfile:
                                        (final UserSucceededAction linkedInUser) {
                                      print(
                                        'Access token ${linkedInUser.user.token.accessToken}',
                                      );

                                      print('User id: ${linkedInUser.user.userId}');

                                      user = UserObject(
                                        firstName: linkedInUser
                                            ?.user?.firstName?.localized?.label,
                                        lastName: linkedInUser
                                            ?.user?.lastName?.localized?.label,
                                        email: linkedInUser
                                            ?.user
                                            ?.email
                                            ?.elements![0]
                                            ?.handleDeep
                                            ?.emailAddress,
                                        profileImageUrl: linkedInUser
                                            ?.user
                                            ?.profilePicture
                                            ?.displayImageContent
                                            ?.elements![0]
                                            ?.identifiers![0]
                                            ?.identifier,
                                      );

                                      setState(() {
                                        logoutUser = false;
                                      });

                                      Navigator.pop(context);
                                    },
                                  ),
                                  fullscreenDialog: true,
                                ),
                              );
                            }),
                      ],
                    ),
                    Center(
                      child: AppUtils.richText(
                          top: AppConstants.thirty,
                          text: StringUtils.anAccount,
                          onTap: onClickSignUp,
                          linkText: StringUtils.signup),
                    ),
                  ],
                ),
              ),
            ),
            isLoading ? AppUtils.showLoader(true) : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget commonButton(
      {double? left,
      double? right,
      double? top,
      String? path,
      VoidCallback? onTap}) {
    return AppUtils.commonInkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: AppConstants.thirty),
        child: Container(
          margin: EdgeInsets.only(
              left: left ?? AppConstants.zero,
              right: right ?? AppConstants.zero,
              top: top ?? AppConstants.zero),
          decoration: AppUtils.containerDecoration(color: Colors.white),
          width: AppConstants.sixty,
          height: AppConstants.sixty,
          child: AppUtils.commonImageAssetWidget(
              path: path,
              width: AppConstants.twentyFour,
              height: AppConstants.twentyFour),
        ),
      ),
    );
  }

  void onClickLogin() {
    AppUtils.closeKeyBoard(context);
    if (Validation.isEmptyString(tetEmail.text)) {
      AppUtils.showMessage(context: context, message: StringUtils.emptyEmail);
    } else if (!Validation.validateEmail(tetEmail.text)) {
      AppUtils.showMessage(context: context, message: StringUtils.validEmail);
    } else if (Validation.isEmptyString(tetPassword.text)) {
      AppUtils.showMessage(
          context: context, message: StringUtils.emptyPassword);
    } else if (tetPassword.text.length < 5) {
      AppUtils.showMessage(
          context: context, message: StringUtils.validPassword);
    }
    else if (!Validation.validatePassword(tetPassword.text.toString())) {
      AppUtils.showMessage(
          context: context, message: StringUtils.validPasswordRegex);
    }else {

      callLoginApi();



      /*tetEmail.text == 'admin@gmail.com'
          ? AppUtils.redirectToNextScreen(
              context: context,
              screenName: RouteName.adminDashboard,
              arguments: true)
          : AppUtils.redirectToNextScreen(
              context: context,
              screenName: RouteName.dashboard,
              arguments: false);*/
     /* tetEmail.clear();
      tetPassword.clear();*/
    }
  }
  callLoginApi() async {
    setState(() {
      isLoading = true;
    });
    LoginModel loginModel =
    await LoginProvider.loginUser(tetEmail.text.toString(), tetPassword.text.toString(), context);

    if (loginModel.success != null && loginModel.success == true) {
      userInfo = loginModel.data;
      PreferenceHelper.setBool(PreferenceHelper.IS_LOGIN, true);
      /*print('====userInfo${userInfo!.appView}');*/
      AppUtils.redirectToNextScreen(context: context,screenName: RouteName.dashboard,arguments: false);
    /*  Navigator.of(context)
          .pushNamedAndRemoveUntil(RouteName.dashboard, (route) => false);*/
      AppUtils.showMessage(
          context: context, message: StringUtils.LOGIN_MESSAGE, backgroundColor: AppColor.colorGreen);
    } else {
      AppUtils.showMessage(context: context, message: loginModel.message.toString(),backgroundColor: AppColor.colorRedLight);
    }
    setState(() {
      isLoading = false;
    });
  }
  void onClickForgot() {
    AppUtils.redirectToNextScreen(
        context: context, screenName: RouteName.verification);
  }

  void onClickSignUp() {
    AppUtils.redirectToNextScreen(
        context: context, screenName: RouteName.signup);
  }



  Future<Resource?> signInWithFacebook() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          final userCredential =
              await _auth.signInWithCredential(facebookCredential);
          return Resource(status: Status.Success);
        case LoginStatus.cancelled:
          return Resource(status: Status.Cancelled);
        case LoginStatus.failed:
          return Resource(status: Status.Error);
        default:
          return null;
      }
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      var userData = await FacebookAuth.i.getUserData(
        fields: "name,email,picture.width(200),birthday,friends,gender,link",
      );
      setState(() {
        _userData = userData;
        _name = _userData?['name'];
        _loggedIn = true;
      });
    } else {
      print(result.status);
      print(result.message);
    }
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    setState(() {
      _name = "You're not logged in";
      _loggedIn = false;
    });
  }
}

class UserObject {
  UserObject({
    this.firstName,
    this.lastName,
    this.email,
    this.profileImageUrl,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profileImageUrl;
}
