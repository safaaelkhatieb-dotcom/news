
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import '../../../model/Category.dart';
class CategoryItem extends StatelessWidget{
  final Category category;
  final int index;
  const CategoryItem({super.key,required this.category,required
  this.index});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      clipBehavior:Clip.antiAlias,
      decoration: BoxDecoration(borderRadius:
      BorderRadiusGeometry.circular(24)),
      child: Stack(
        alignment: (index%2==0)?Alignment.bottomRight:Alignment.bottomLeft,
        children: [
          Image.asset(category.image),
          Container(
            height: height*0.20,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                Text(category.title,style:Theme.of(context).
                textTheme.labelMedium,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: width*0.40,

                    decoration: BoxDecoration(color: AppColors.greyColor,
                        borderRadius: BorderRadiusGeometry.circular(84)
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection:(index%2==0)?TextDirection.ltr:TextDirection.rtl ,
                         children: [
                          Text('  View All  ',style: Theme.of(context).textTheme.headlineMedium,),
                          CircleAvatar(
                            backgroundColor:Theme.of(context).primaryColor ,
                            child:(index%2==0)? Icon(Icons.arrow_forward_ios_outlined,
                            color: Theme.of(context).splashColor):Icon(Icons.arrow_back_ios_new_outlined,
                                color: Theme.of(context).splashColor),
                          )
                        ],
                      )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}