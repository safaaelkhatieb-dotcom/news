import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:news_app/home/drawer/drawer_item.dart';
import 'package:news_app/home/drawer/localization.dart';
import 'package:news_app/home/drawer/theme_botton_sheet.dart';
import 'package:news_app/home/drawer/theming.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget{
  final VoidCallback onDrawerItemClick;
  const HomeDrawer({super.key,required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {

    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    // TODO: implement build
    return Column(
      children: [
        Container(
          height: height*0.2,
          width: double.infinity,
          color: AppColors.whiteColor,
          child: Center(child: Text('News App',style: AppStyles.bold24Black,)),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                 onDrawerItemClick();
                },
                child: DrawerItem(
                  icon: CupertinoIcons.home,
                  title: 'Go To Home',
                  color: AppColors.whiteColor,
                ),
              ),

              Divider(color: AppColors.whiteColor,),
              DrawerItem(icon: Icons.imagesearch_roller_rounded, title:'Theme',
                color: AppColors.whiteColor,),
              ThemingBottom(),
              Divider(color: AppColors.whiteColor,),
              DrawerItem(icon: Icons.language, title: 'Language',
                  color: AppColors.whiteColor),
              LocalizationBottom(),
            ],
          ),
        )
      ],
    );
  }

}