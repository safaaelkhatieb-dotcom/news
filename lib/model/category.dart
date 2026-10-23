import 'package:news_app/utils/app_assets.dart';

class Category {
  String id;
  String title;
  String image;


  Category({
    required this.id,
    required this.title,
    required this.image
  });
  /*
  business/entertainment/general/health/science/sports/technology
   */
static List<Category> getCategoryList(bool isDark){
  return [
    Category(id: 'general', title: 'General',
      image: isDark? AppAssets.general:AppAssets.generalDark),
   Category(id: 'business', title: 'Business',
       image:isDark? AppAssets.busniess:AppAssets.busniessDark ),
    Category(id: 'sports', title: 'Sports',
        image:isDark? AppAssets.sport:AppAssets.sportDark ),
    Category(id: 'technology', title: 'Technology',
        image:isDark? AppAssets.technology:AppAssets.technologyDark ),
    Category(id: 'science', title: 'Science',
        image:isDark? AppAssets.science:AppAssets.scienceDark ),
    Category(id: 'health', title: 'Health',
        image:isDark? AppAssets.health:AppAssets.healthDark ),
    Category(id: 'entertainment', title: 'Entertainment',
        image:isDark? AppAssets.entertainment:AppAssets.entertainmentDark )
  ];
}
}