import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:music_player/res/app_styles/app_text_styles.dart';
import 'package:music_player/store/application/app_state.dart';
import 'package:music_player/ui/layouts/main_layout/main_layout.dart';
import 'package:music_player/ui/pages/auth_page/auth_page_vm.dart';
import 'package:music_player/ui/pages/shared/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthPageVM>(
      converter: AuthPageVM.fromStore,
      builder: (BuildContext context, AuthPageVM vm) {
        return MainLayout(
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
          isBottomBar: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter email',
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
                'Enter password',
                style: AppTextStyles.s24fw700White,
              ),
              CustomTextField(
                focusNode: passwordFocus,
                textEditingController: passwordController,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                'Confirm password',
                style: AppTextStyles.s24fw700White,
              ),
              CustomTextField(
                focusNode: confirmPasswordFocus,
                textEditingController: confirmPasswordController,
              ),
              Center(
                child: InkWell(
                  onTap: () => vm.registerWithEmail(emailController.text, passwordController.text),
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
                      'Register',
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
