import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/utils/dialogs.dart';
import 'package:weather_science/src/core/widgets/common_text.dart';
import '../../../../core/di/di.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/inputs_area.dart';
import '../widgets/login_button.dart';
import '../widgets/google_button.dart';
import '../widgets/register.dart';
import '../widgets/welcome.dart';

@RoutePage()
class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  final FocusNode _loginFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _loginFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _loginFocusNode.unfocus();
        _passwordFocusNode.unfocus();
      },
      child: CupertinoPageScaffold(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60.h),
                const Welcome(),
                SizedBox(height: 60.h),
                InputsArea(
                  loginController: _loginController,
                  passwordController: _passwordController,
                  loginFocusNode: _loginFocusNode,
                  passwordFocusNode: _passwordFocusNode),
                SizedBox(height: 32.h),
                LoginButton(onLogin: _onLogin),
                SizedBox(height: 24.h),
                CommText(text: 'authView.authWith'.tr()),
                SizedBox(height: 16.h),
                GoogleButton(onRegister: _onLoginWithGoogle),
                SizedBox(height: 16.h),
                Register(onPressed: () {  },),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onLogin() async {
    if (_formKey.currentState!.validate()) {
      di<AuthBloc>().add(LoginWithGoogleEvent(context: context));
    }
  }

  Future<void> _onLoginWithGoogle() async {
    DialogUtils.showLoading(context);
    di<AuthBloc>().add(LoginWithGoogleEvent(context: context));
  }
}
