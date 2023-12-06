import 'dart:ui';

class CategoryModel{
  String id;
  String name;
  String image;
  Color color;

  CategoryModel(this.id, this.name, this.image, this.color);

  static List<CategoryModel>getCategories(){
    return[
      CategoryModel("business", "Business", "assets/images/bussines.png", Color(0xffCF7E48)),
      CategoryModel("entertainment", "Entertainment", "assets/images/environment.png", Color(0xff559be8)),
      CategoryModel("general", "General", "assets/images/Politics.png", Color(0xff0870ec)),
      CategoryModel("health", "Health", "assets/images/health.png", Color(0xffef6ab1)),
      CategoryModel("science", "Science", "assets/images/science.png", Color(0xfff7fc5f)),
      CategoryModel("sports", "Sports", "assets/images/ball.png", Color(0xffd22525)),
      CategoryModel("technology", "Technology", "assets/images/bussines.png", Color(0xff78ee7d)),
    ];
  }


}