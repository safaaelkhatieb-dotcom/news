import 'package:flutter/material.dart';
import 'package:news_app/home/drawer/theme_botton_sheet.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';


class ThemingBottom extends StatelessWidget {
  const ThemingBottom({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const ThemeBottomSheet(),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.02),
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.015,
                  horizontal: width * 0.04,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.whiteColor, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.appTheme == ThemeMode.dark
                          ? "Dark Theme"
                          : "Light Theme",
                      style: AppStyles.bold20White
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.whiteColor,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
    );
  }
}
