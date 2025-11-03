import 'package:flutter/material.dart';
import 'package:news_app/home/category_details/category_details.dart';
import 'package:news_app/home/drawer/home_drawer.dart';
import 'package:news_app/home/search/search.dart';
import 'package:news_app/model/Category.dart';
import 'package:news_app/utils/app_colors.dart';

import 'category_details/category_fregment/category_fregment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            selectedCategory == null?'Home'
                :selectedCategory!.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child:HomeDrawer(onDrawerItemClick:onDrawerItemClick ,),
      ),
      body: selectedCategory == null
          ? CategoryFragment(
        onClickCategoryItem: (Category category) {
          setState(() {
            selectedCategory = category;
          });
        },
      )
          : CategoryDetails(
        category: selectedCategory!,
        onBack: () {
          setState(() {
            selectedCategory = null;
          });
        },
      ),
    );
  }
  void onDrawerItemClick(){
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });

  }
}
