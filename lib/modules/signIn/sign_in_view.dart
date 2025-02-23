import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/main.dart';
import 'package:flutter/material.dart';
import 'package:evently_app/core/extensions/extensions.dart';
import 'package:evently_app/core/theme/color_palette.dart';
import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/widgets/custom_text_field.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppAssets.eventlyLogo,
            height: 0.2.height
          ),
          const CustomTextField(
            hint: "Email",
            hintColor: ColorPalette.generalGreyColor,
            prefixIcon: ImageIcon(AssetImage(AppAssets.mailIcn))
          ).setOnlyPadding(context, 0.03, 0.01, 0.0, 0.0),
          const CustomTextField(
            isPassword: true,
            maxLines: 1,
            hint: "Password",
            hintColor: ColorPalette.generalGreyColor,
            prefixIcon: ImageIcon(AssetImage(AppAssets.lockIcn))
          ).setOnlyPadding(context, 0.01, 0.0, 0.0, 0.0),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                navigatorKey.currentState!.pushNamed(PagesRouteName.forgetPassword);
              },
              child: Text(
                "Forgot password?",
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: ColorPalette.primaryColor,
                  decorationThickness: 1.5,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorPalette.primaryColor
                )
              )
            ),
          ).setVerticalPadding(context, 0.015),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: ColorPalette.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)
              )
            ),
            child: Text(
              "Login",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorPalette.white
              )
            )
          ),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: "Don't have account?  ",
                  style: theme.textTheme.titleMedium
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.pushNamed(PagesRouteName.signUp);
                    },
                    child: Text(
                      "Create account",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: ColorPalette.primaryColor,
                        decorationThickness: 1.5,
                        decoration: TextDecoration.underline,
                        decorationColor: ColorPalette.primaryColor
                      )
                    )
                  )
                )
              ]
            )
          ).setVerticalPadding(context, 0.02),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: ColorPalette.primaryColor,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20
                )
              ),
              Text(
                "OR",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: ColorPalette.primaryColor
                )
              ),
              Expanded(
                child: Divider(
                  color: ColorPalette.primaryColor,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20
                )
              )
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
                side: BorderSide(
                  color: ColorPalette.primaryColor
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.googleIcn, height: 25.0),
                SizedBox(width: 10),
                Text(
                  "Login With Google",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorPalette.primaryColor
                  )
                )
              ],
            )
          ).setVerticalPadding(context, 0.02)
        ],
      ).setHorizontalPadding(context, 0.05)
    );
  }
}
