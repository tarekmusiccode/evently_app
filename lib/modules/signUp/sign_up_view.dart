import '/main.dart';
import 'package:evently_app/core/extensions/validations.dart';
import 'package:evently_app/core/utils/firebase_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '/core/theme/color_palette.dart';
import '/core/constants/app_assets.dart';
import '/core/extensions/extensions.dart';
import '/core/routes/pages_route_name.dart';
import '/core/widgets/custom_text_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              AppAssets.eventlyLogo,
              height: 0.2.height,
            ),
            CustomTextField(
              controller: _nameController,
              hint: "Name",
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
              hintColor: ColorPalette.generalGreyColor,
              prefixIcon: const ImageIcon(
                AssetImage(AppAssets.personIcn),
                color: ColorPalette.generalGreyColor,
              ),
            ).setOnlyPadding(context, 0.03, 0.0, 0.0, 0.0),
            CustomTextField(
              controller: _emailController,
              hint: "Email",
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter your email address";
                }
                if (!Validations.validateEmail(value)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
              hintColor: ColorPalette.generalGreyColor,
              prefixIcon: const ImageIcon(
                AssetImage(AppAssets.mailIcn),
                color: ColorPalette.generalGreyColor,
              ),
            ).setOnlyPadding(context, 0.02, 0.01, 0.0, 0.0),
            CustomTextField(
              controller: _passwordController,
              isPassword: true,
              maxLines: 1,
              hint: "Password",
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter your password";
                }
                if (!Validations.validatePassword(value)) {
                  return "Please enter a valid password";
                }
                return null;
              },
              hintColor: ColorPalette.generalGreyColor,
              prefixIcon: const ImageIcon(
                AssetImage(AppAssets.lockIcn),
                color: ColorPalette.generalGreyColor,
              ),
            ).setOnlyPadding(context, 0.01, 0.01, 0.0, 0.0),
            CustomTextField(
              isPassword: true,
              maxLines: 1,
              hint: "Re-Password",
              hintColor: ColorPalette.generalGreyColor,
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please re-enter your password";
                }
                if (value != _passwordController.text) {
                  return "Password not matched";
                }
                return null;
              },
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.lockIcn),
                color: ColorPalette.generalGreyColor,
              ),
            ).setOnlyPadding(context, 0.01, 0.0, 0.0, 0.0),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  FirebaseFunctions.createAccount(
                    emailAddress: _emailController.text,
                    password: _passwordController.text,
                  ).then(
                    (value) {
                      EasyLoading.dismiss();
                      if (value == true) {
                        navigatorKey.currentState!.pushNamedAndRemoveUntil(
                          PagesRouteName.signIn,
                          (route) => false,
                        );
                      }
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ColorPalette.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              child: Text(
                "Register",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.white,
                ),
              ),
            ).setVerticalPadding(context, 0.04),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "Don't Have Account? ",
                    style: theme.textTheme.titleMedium,
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        navigatorKey.currentState!
                            .pushNamed(PagesRouteName.signUp);
                      },
                      child: Text(
                        "Create Account",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: ColorPalette.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorPalette.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).setHorizontalPadding(context, 0.05),
      ),
    );
  }
}
