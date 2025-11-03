import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_styles.dart';

class DrawerItem extends StatelessWidget{
  final IconData icon ;
  final String title;
  final Color color;
  const DrawerItem({super.key,
    required this.icon,
    required this.title,
  required this.color});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    // TODO: implement build
   return Padding(
     padding:  EdgeInsets.symmetric(vertical: height*0.01),
     child: Row(
       children: [
         Icon(icon,color: color,),
         SizedBox(width:width*0.04 ,),
         Text(title,style: AppStyles.bold20White,),

       ],
     ),
   );
  }

}