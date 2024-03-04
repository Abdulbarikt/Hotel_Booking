import 'package:flutter/material.dart';
import 'package:hotel_booking/app/model/image.dart';
import 'package:hotel_booking/app/utils/colorconstans.dart';
import 'package:hotel_booking/app/view/auth/signup/signup.dart';

import '../../onboarding/widgets/primarybutton.dart';
import '../widgets/authfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isRemember = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kLightWhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Center(
                  child: Text('Sign In',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
              const SizedBox(height: 5),
              const Text('Welcome back! Please enter your details',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.black)),
              const SizedBox(height: 68),
              AuthField(
                  iconColor: AppColors.kLavender,
                  controller: _mailController,
                  keyboardType: TextInputType.emailAddress,
                  icon: AppAssets.kMail,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    } else {
                      // Regular expression pattern to validate email addresses
                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                    }
                    return null;
                  },
                  hintText: 'Email address'),
              const SizedBox(height: 16),
              AuthField(
                  iconColor: AppColors.kPeriwinkle,
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  icon: AppAssets.kLock,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (!_isPasswordStrong(value)) {
                      return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one digit.';
                    }
                    return null;
                  },
                  hintText: 'Password'),
              const SizedBox(height: 14),
              RememberMeCheckbox(
                onRememberChanged: (value) {
                  setState(() {
                    isRemember = value;
                  });
                },
              ),
              const SizedBox(height: 55),
              CustomTextButton(onPressed: () {}, text: 'Forgot Password'),
              PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  text: 'Sign In'),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Text('Create account',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  PrimaryButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    text: 'Sign Up',
                    height: 30,
                    width: 70,
                    fontColor: AppColors.kkPrimary,
                    btnColor: AppColors.kLightWhite2,
                    fontSize: 12,
                  )
                ],
              ),
              const SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(onTap: () {}, icon: AppAssets.kGoogle),
                  const SizedBox(width: 31),
                  SocialButton(onTap: () {}, icon: AppAssets.kFacebook),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _isPasswordStrong(String password) {
    if (password.length < 8) {
      return false;
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return false;
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return false;
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    }
    return true;
  }
}
