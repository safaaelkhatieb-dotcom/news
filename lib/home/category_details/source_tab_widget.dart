import 'package:flutter/material.dart';
import 'package:news_app/home/category_details/widget/source_name.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/news/new_widget.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  final List<Source> sourcesList;

  const SourceTabWidget({super.key, required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            indicatorColor: Theme.of(context).splashColor,
            dividerColor: AppColors.trancColor,
            isScrollable: true,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabs: List.generate(
              widget.sourcesList.length,
                  (index) => SourceName(
                source: widget.sourcesList[index],
                isSelected: selectedIndex == index,
              ),
            ),
          ),
          Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]))
        ],
      ),
    );
  }
}

