import 'package:flutter/material.dart';
import 'package:evently_app/main.dart';
import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/extensions.dart';
import 'package:evently_app/core/routes/pages_route_name.dart';
import 'package:evently_app/core/theme/color_palette.dart';
import 'package:evently_app/core/widgets/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register")
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Image.asset(
            AppAssets.eventlyLogo,
            height: 0.2.height
          ),
          const CustomTextField(
            hint: "Name",
            hintColor: ColorPalette.generalGreyColor,
            prefixIcon: ImageIcon(AssetImage(AppAssets.personIcn))
          ).setOnlyPadding(context, 0.03, 0.0, 0.0, 0.0),
          const CustomTextField(
            hint: "Email",
            hintColor: ColorPalette.generalGreyColor,
            prefixIcon: ImageIcon(AssetImage(AppAssets.mailIcn))
          ).setOnlyPadding(context, 0.02, 0.01, 0.0, 0.0),
          const CustomTextField(
            isPassword: true,
            maxLines: 1,
            hint: "Password",
            hintColor: ColorPalette.generalGreyColor,
            prefixIcon: ImageIcon(AssetImage(AppAssets.lockIcn))
          ).setOnlyPadding(context, 0.01, 0.01, 0.0, 0.0),
          const CustomTextField(
            isPassword: true,
            maxLines: 1,
            hint: "Re-Password",
            hintColor: ColorPalette.generalGreyColor,
            prefixIcon: ImageIcon(AssetImage(AppAssets.lockIcn))
          ).setOnlyPadding(context, 0.01, 0.0, 0.0, 0.0),
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
              "Create Account",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorPalette.white
              )
            )
          ).setVerticalPadding(context, 0.05),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: "Already have an account?  ",
                  style: theme.textTheme.titleMedium
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.pushNamed(PagesRouteName.signIn);
                    },
                    child: Text(
                      "LogIn",
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
        ],
      ).setHorizontalPadding(context, 0.05)
    );
  }
}
