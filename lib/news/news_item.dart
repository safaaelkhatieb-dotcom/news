import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.news});
  final News news;


  Future<void> openInBrowser(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open the article link')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.whiteColor : AppColors.blackColor;
    final bgButtonColor = isDark ? AppColors.blackColor : AppColors.whiteColor;
    final textColor = isDark ? AppColors.blackColor : AppColors.whiteColor;
    final textColorButton = isDark ? AppColors.whiteColor : AppColors.blackColor;

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (_) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).splashColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            padding: EdgeInsets.only(
              top: height * 0.02,
              left: width * 0.04,
              right: width * 0.04,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[700] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  SizedBox(height: height * 0.02),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: news.urlToImage ?? '',
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.greyColor,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  SizedBox(height: height * 0.015),

                  Text(
                    news.title ?? '',
                    style:Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: height * 0.01),


                  if (news.description != null && news.description!.isNotEmpty)
                    Text(
                      news.description!,
                      style:Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),

                  SizedBox(height: height * 0.02),

                  SizedBox(
                    width: double.infinity, // ياخد عرض الـ sheet كله
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        if (news.url != null && news.url!.isNotEmpty) {
                          openInBrowser(context, news.url!);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('No URL available for this article')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14), // ارتفاع مريح
                      ),
                      label: Text(
                        'Read Full Article',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.02,
        ),
        margin: EdgeInsets.symmetric(horizontal: width * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).splashColor,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            // صورة الخبر
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(color: AppColors.greyColor),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(height: height * 0.01),

            // العنوان
            Text(
              news.title ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: height * 0.01),

            // الكاتب والتاريخ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text('By : ${news.author ?? ''}', style: AppStyles.MidGray12),
                ),
                Text(news.publishedAt ?? '', style: AppStyles.MidGray12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
