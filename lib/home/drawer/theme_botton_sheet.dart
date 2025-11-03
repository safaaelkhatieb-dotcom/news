import 'package:flutter/material.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [

          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: themeProvider.appTheme == ThemeMode.light
                ? getSelectedItemWidget(language: "Light Theme", context: context)
                : getUnselectedItemWidget(language: "Light Theme", context: context),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: themeProvider.appTheme == ThemeMode.dark
                ? getSelectedItemWidget(language: "Dark Theme", context: context)
                : getUnselectedItemWidget(language: "Dark Theme", context: context),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget({
    required String language,
    required BuildContext context,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language,style: AppStyles.bold16,),
        Icon(Icons.check, color: Theme.of(context).splashColor),
      ],
    );
  }

  Widget getUnselectedItemWidget({
    required String language,
    required BuildContext context,
  }) {
    return Text(language,style: AppStyles.bold16, );
  }
}
