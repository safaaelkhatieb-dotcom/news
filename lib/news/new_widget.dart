import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/utils/app_colors.dart';
import '../model/SourceResponse.dart';

class NewsWidget extends StatefulWidget{
  final Source source;
  const NewsWidget({super.key,required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    // TODO: implement build
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceID(widget.source.id??''),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('SomeThing went wrong',
                style: Theme.of(context).textTheme.bodyMedium),
                ElevatedButton(onPressed: () {
                  ApiManager.getNewsBySourceID(widget.source.id??'');
                  setState(() {

                  });
                 },
                    child: Text('Try again',
                    style: Theme.of(context).textTheme.bodyMedium,))
              ],
            );
          }
          if(snapshot.data!.status!='ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!,
                    style: Theme.of(context).textTheme.bodyMedium),
                ElevatedButton(onPressed: () {
                  ApiManager.getNewsBySourceID(widget.source.id??'');
                  setState(() {

                  });
                },
                    child: Text('Try again',
                      style: Theme.of(context).textTheme.bodyMedium,))
              ],
            );
          }
          var newList =snapshot.data?.articles??[];
          return Padding(
            padding: EdgeInsets.only(top:
            height*0.02),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return NewsItem(news: newList[index]);
                },
              separatorBuilder: (context, index)=>
                SizedBox(height: height*0.02,),

                itemCount: newList.length,
            ),
          );
        },) ;
  }
}