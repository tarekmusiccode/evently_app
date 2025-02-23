import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/core/utils/firebase_function.dart';
import 'package:evently_app/main.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/core/extensions/extensions.dart';
import 'package:evently_app/core/theme/color_palette.dart';
import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/widgets/custom_text_field.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppAssets.eventlyLogo,
              height: 0.2.height,
            ),
            CustomTextField(
              controller: _emailController,
              hint: "Email",
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "plz enter your email address";
                }
                return null;
              },
              hintColor: ColorPalette.generalGreyColor,
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.mailIcn),
                color: ColorPalette.generalGreyColor,
              ),
            ).setOnlyPadding(context, 0.03, 0.01, 0.0, 0.0),
            CustomTextField(
              controller: _passwordController,
              isPassword: true,
              maxLines: 1,
              hint: "Password",
              onValidate: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "plz enter your email address";
                }
                return null;
              },
              hintColor: ColorPalette.generalGreyColor,
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.lockIcn),
                color: ColorPalette.generalGreyColor,
              ),
            ).setOnlyPadding(context, 0.01, 0.0, 0.0, 0.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  navigatorKey.currentState!
                      .pushNamed(PagesRouteName.forgetPassword);
                },
                child: Text(
                  "Forget password ?",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: ColorPalette.primaryColor,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorPalette.primaryColor,
                  ),
                ),
              ),
            ).setVerticalPadding(context, 0.015),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  FirebaseFunctions.login(
                    emailAddress: _emailController.text,
                    password: _passwordController.text,
                  ).then(
                    (value) {
                      if (value) {
                        EasyLoading.dismiss();
                        navigatorKey.currentState!.pushNamedAndRemoveUntil(
                          PagesRouteName.layout,
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
                "Login",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.white,
                ),
              ),
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "Don’t Have Account ? ",
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
            ).setVerticalPadding(context, 0.02),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: ColorPalette.primaryColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                ),
                Text(
                  "OR",
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: ColorPalette.primaryColor),
                ),
                const Expanded(
                  child: Divider(
                    color: ColorPalette.primaryColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ColorPalette.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: const BorderSide(color: ColorPalette.primaryColor)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.googleIcn,
                    height: 25.0,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Login With Google",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorPalette.primaryColor,
                    ),
                  ),
                ],
              ),
            ).setVerticalPadding(context, 0.02),
          ],
        ).setHorizontalPadding(context, 0.05),
      ),
    );
  }
}
