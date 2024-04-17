import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/utils/dialogs.dart';
import 'package:weather_science/src/core/utils/pop_up_modal.dart';
import 'package:weather_science/src/core/widgets/common_text.dart';
import '../../../../core/di/di.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/inputs_area.dart';
import '../widgets/login_button.dart';
import '../widgets/google_button.dart';
import '../widgets/signin_or_signup.dart';
import '../widgets/signup_button.dart';
import '../widgets/welcome.dart';

@RoutePage()
class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: "inomjon@gmail.com");
  final _passwordController = TextEditingController(text: "Inomjon");

  final FocusNode _loginFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  late bool _isNoRegister = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _loginFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is NoRegisterState) {
          _isNoRegister = state.isNoRegister;
        }
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
                        loginController: _emailController,
                        passwordController: _passwordController,
                        loginFocusNode: _loginFocusNode,
                        passwordFocusNode: _passwordFocusNode),
                    SizedBox(height: 32.h),
                   _isNoRegister
                       ? SignUpButton(signUp: _signUp)
                       : LoginButton(onLogin: _onLogin),
                    SizedBox(height: 24.h),
                    CommText(text: 'authView.authWith'.tr()),
                    SizedBox(height: 16.h),
                    GoogleButton(onRegister: _onLoginWithGoogle),
                    SizedBox(height: 16.h),
                    SignUpOrSignIn(isNoRegister: _isNoRegister),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _onLogin() async {
    if (_formKey.currentState!.validate()) {
      DialogUtils.showLoading(context);
      di<AuthBloc>().add(LoginEmailPassEvent(
          context: context,
          email: _emailController.text,
          pass: _passwordController.text));
    }
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      DialogUtils.showLoading(context);
      di<AuthBloc>().add(SignUpEmailPassEvent(
          context: context,
          email: _emailController.text,
          pass: _passwordController.text));
    }
  }

  Future<void> _onLoginWithGoogle() async {
    DialogUtils.showLoading(context);
    di<AuthBloc>().add(LoginWithGoogleEvent(context: context));
  }
}
