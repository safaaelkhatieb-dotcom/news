import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category_details/source_tab_widget.dart';
import 'package:news_app/model/Category.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;
  const CategoryDetails({super.key, required this.category, required Null Function() onBack});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(categoryId: widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.greyColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Something went wrong'),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text(
                  'Try again!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          );
        }

        if (snapshot.data?.status != 'ok') {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data!.message ?? 'Error'),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources(categoryId:widget.category.id );
                  setState(() {});
                },
                child: Text(
                  'Try again!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          );
        }

        var sourceList = snapshot.data?.sources ?? [];
        return SourceTabWidget(sourcesList: sourceList);
      },
    );
  }
}
