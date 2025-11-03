
import 'package:flutter/material.dart';
import 'package:news_app/home/category_details/category_fregment/category_item.dart';
import 'package:news_app/model/Category.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

typedef OnClickCategoryItem = void Function(Category);
class CategoryFragment extends StatelessWidget{
  final OnClickCategoryItem onClickCategoryItem;
   CategoryFragment({super.key,required this.onClickCategoryItem});
  List<Category> categoryList =[];

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    bool isDark = themeProvider.isDark;
    categoryList = Category.getCategoryList(isDark);
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good Morning\nHere is Some News For You',
          style: Theme.of(context).textTheme.headlineMedium,),
          Expanded(child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                onClickCategoryItem(categoryList[index]);
                  },
                    child: CategoryItem(
                  category: categoryList[index],
                  index: index,));
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height*0.02,);
              },
              itemCount: 7))
        ],
      ),
    );
  }
}