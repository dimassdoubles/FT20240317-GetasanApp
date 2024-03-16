import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getasan_app/features/auth/presentation/page/login_page.dart';
import 'package:getasan_app/features/common/constant/style/app_colors.dart';
import 'package:getasan_app/features/common/constant/style/app_texts.dart';
import 'package:getasan_app/features/common/helper/input_formater_helper.dart';
import 'package:getasan_app/features/common/helper/input_validator_helper.dart';
import 'package:getasan_app/features/common/helper/keyboard_helper.dart';
import 'package:getasan_app/features/common/helper/state_dialog_helper.dart';
import 'package:getasan_app/features/common/presentation/widget/button/primary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/button/secondary_button.dart';
import 'package:getasan_app/features/common/presentation/widget/gaps.dart';
import 'package:getasan_app/features/common/presentation/widget/input/password_input.dart';
import 'package:getasan_app/features/common/presentation/widget/input/text_input.dart';
import 'package:getasan_app/features/home/presentation/page/home_page.dart';

class RegistrasiPage extends ConsumerStatefulWidget {
  const RegistrasiPage({super.key});

  @override
  ConsumerState<RegistrasiPage> createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends ConsumerState<RegistrasiPage> {
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _verifPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _verifPasswordController.dispose();
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
                'Registrasi',
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
                    children: [
                      TextInput(
                        controller: _namaController,
                        keyboardType: TextInputType.name,
                        label: 'Nama Lengkap',
                      ),
                      Gaps.v16,
                      TextInput(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          return InputValidatorHelper.formEmail(value!);
                        },
                        inputFormatters: InputFormatterHelper.forEmail,
                        label: 'Email',
                      ),
                      Gaps.v16,
                      PasswordInput(
                        controller: _passwordController,
                        label: 'Password',
                      ),
                      Gaps.v16,
                      PasswordInput(
                        controller: _verifPasswordController,
                        isRequired: false,
                        validator: (value) {
                          if (_passwordController.text != value) {
                            return 'Verifikasi password berbeda dengan password';
                          }

                          return null;
                        },
                        label: 'Verifikasi Password',
                      ),
                      SizedBox(
                        height: 48.h,
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
                  PrimaryButton(
                    label: 'Registrasi',
                    onTap: () async {
                      KeyboardHelper.close(context);

                      if (_formKey.currentState!.validate()) {
                        debugPrint('Registrasi credential:');
                        debugPrint('- nama: ${_namaController.text}');
                        debugPrint('- email: ${_emailController.text}');
                        debugPrint('- password: ${_passwordController.text}');

                        StateDialogHelper.showLoading();
                        await Future.delayed(const Duration(seconds: 3));
                        StateDialogHelper.dismiss();

                        Navigator.pushReplacement(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    },
                  ),
                  Gaps.v24,
                  SecondaryButton(
                    label: 'Login',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
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
