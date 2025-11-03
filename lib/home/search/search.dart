import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/utils/app_colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<News> articles = [];
  bool isLoading = false;
  bool hasSearched = false;

  Future<void> fetchSearchNews(String query) async {
    if (query.isEmpty) return;

    setState(() {
      isLoading = true;
      hasSearched = true;
    });

    final url = Uri.parse(
      'https://newsapi.org/v2/everything?q=$query&apiKey=45f70e19db484aca8531ecd94c7523d5',
    );
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=45f70e19db484aca8531ecd94c7523d5
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final newsResponse = NewsResponse.fromJson(data);
        setState(() {
          articles = newsResponse.articles ?? [];
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      setState(() => isLoading = false);
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text('Search News')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for news...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                if (value.length > 2) {
                  fetchSearchNews(value);
                }
              },

            ),

            SizedBox(height: height * 0.02),


            if (isLoading)
              const Center(
                child: CircularProgressIndicator(color: AppColors.greyColor),
              )


            else if (hasSearched && articles.isEmpty)
              const Text('No results found')

            else if (articles.isNotEmpty)
                Expanded(
                  child: ListView.separated(
                    itemCount: articles.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: height * 0.02),
                    itemBuilder: (context, index) {
                      return NewsItem(news: articles[index]);
                    },
                  ),
                )
              else
                const SizedBox(),
          ],
        ),
      ),
    );
  }
}
