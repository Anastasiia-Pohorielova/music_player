import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/pages/auth_page/auth_page_vm.dart';
import 'package:music_player/ui/pages/shared/custom_text_field.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  FocusNode emailFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    emailFocus.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    emailFocus.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthPageVM>(
      converter: AuthPageVM.fromStore,
      builder: (BuildContext context, AuthPageVM vm) {
        return MainLayout(
          isBottomBar: false,
          customAppBar: Container(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => vm.pop(),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: AppTextStyles.s24fw700White,
              ),
              CustomTextField(
                focusNode: emailFocus,
                textEditingController: emailController,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Password',
                style: AppTextStyles.s24fw700White,
              ),
              CustomTextField(
                focusNode: passwordFocus,
                textEditingController: passwordController,
              ),
              Center(
                child: InkWell(
                  onTap: () => vm.loginWithEmail(emailController.text, passwordController.text),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20.0),
                    height: 50.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: AppColors.green,
                    ),
                    child: Text(
                      'Log in',
                      style: AppTextStyles.s24fw700White,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
