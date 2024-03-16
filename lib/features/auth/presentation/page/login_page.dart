import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/helper/input_formater_helper.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/secondary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/input/password_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';
import 'package:getasan_app/features/home/presentation/page/home_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Center(
              child: Text(
                'Login',
                style: AppTexts.extraBold.copyWith(
                  color: AppColors.primary,
                  fontSize: 35,
                  letterSpacing: 0.2.w,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(48.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextInput(
                        controller: _emailController,
                        inputFormatters: InputFormatterHelper.forEmail,
                        keyboardType: TextInputType.emailAddress,
                        label: 'Email',
                      ),
                      Gaps.v16,
                      PasswordInput(
                        controller: _passwordController,
                        label: 'Password',
                      ),
                      Gaps.v16,
                      Text(
                        'Lupa Password?',
                        style: AppTexts.extraBold.copyWith(
                          fontSize: 15,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(48.w, 16.w, 48.w, 48.w),
              child: Column(
                children: [
                  SecondaryButton(
                    label: 'Registrasi',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                  Gaps.v24,
                  PrimaryButton(
                    label: 'Login',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        debugPrint('Login credential:');
                        debugPrint('- Email: ${_emailController.text}');
                        debugPrint('- Password: ${_passwordController.text}');

                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const HomePage(),
                        //   ),
                        // );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
