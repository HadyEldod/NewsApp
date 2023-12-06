import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/widgets/caregory_item.dart';
class CategoriesScreen extends StatelessWidget {

  Function onCategorySelected;
  CategoriesScreen(this.onCategorySelected);

var categories=CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Read About.... ",style:
          TextStyle(
              fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white)),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
                mainAxisSpacing: 16,
              crossAxisSpacing: 24,
            ), itemBuilder: (context,index){

              return  InkWell(
                onTap: (){
                  onCategorySelected(categories[index]);
                },
                  child:CategoryItem(categories[index],index));
            },
              itemCount: categories.length,
            ),
          )

        ],
      ),
    );
  }
}
