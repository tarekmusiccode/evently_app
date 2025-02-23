import 'package:evently_app/core/constants/app_assets.dart';
import 'package:evently_app/core/extensions/padding_ext.dart';
import 'package:evently_app/core/theme/color_palette.dart';
import 'package:evently_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password")
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.forgetImg),
          const CustomTextField(
            hint: "Email",
            hintColor: ColorPalette.generalGreyColor,
            prefixIcon: ImageIcon(AssetImage(AppAssets.mailIcn))
          ).setOnlyPadding(context, 0.02, 0.01, 0.0, 0.0),
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
              "Reset Password",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorPalette.white
              )
            )
          ).setVerticalPadding(context, 0.05)
        ],
      ).setHorizontalPadding(context, 0.05),
    );
  }
}