import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/app/view/auth/signin/signin.dart';

import '../../../model/image.dart';
import '../../../utils/colorconstans.dart';
import '../../onboarding/widgets/primarybutton.dart';
import '../widgets/authfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isRemember = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 56),
              const Center(
                  child: Text('Sign Up',
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
                  iconColor: const Color(0xFFFFEADB),
                  controller: _usernameController,
                  keyboardType: TextInputType.name,
                  icon: AppAssets.kUser,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Full Name';
                    } else if (value.contains(RegExp(r'[0-9]'))) {
                      return 'Full Name should not contain digits';
                    }
                    return null;
                  },
                  hintText: 'Full Name'),
              const SizedBox(height: 16),
              AuthField(
                  iconColor: const Color(0xFFEBD9EF),
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
                  iconColor: const Color(0xFFE0E9FF),
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
              PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  text: 'Sign Up'),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Text('Already have an account',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  PrimaryButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()));
                    },
                    text: 'Sign In',
                    height: 30,
                    width: 70,
                    fontColor: const Color(0xFF3DB9FF),
                    btnColor: const Color(0xFFF7F7F7),
                    fontSize: 12,
                  )
                ],
              ),
              const SizedBox(height: 56),
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

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double? fontSize;
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: color ?? AppColors.kPrimary, fontSize: fontSize ?? 14),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final Color? iconColor;
  const SocialButton(
      {super.key, required this.onTap, required this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 59,
        width: 59,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.kLightWhite,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 32,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(0.25))
            ]),
        child: SvgPicture.asset(
          icon,
          // color: iconColor,
        ),
      ),
    );
  }
}

class RememberMeCheckbox extends StatefulWidget {
  final void Function(bool) onRememberChanged;
  const RememberMeCheckbox({super.key, required this.onRememberChanged});

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isRemember = !isRemember;
        });

        widget.onRememberChanged(isRemember);
      },
      child: Row(
        children: [
          Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
                color: isRemember ? AppColors.kPrimary : null,
                borderRadius: BorderRadius.circular(6),
                border: !isRemember
                    ? Border.all(color: const Color(0xFFB6B6B8))
                    : null),
            child: isRemember
                ? Icon(Icons.done, size: 14, color: AppColors.kLightWhite)
                : null,
          ),
          const SizedBox(width: 10),
          const Text(
            'Remember',
            style: TextStyle(fontSize: 12, color: Colors.black),
          )
        ],
      ),
    );
  }
}
