import 'package:flutter/material.dart';
import '../dummyData.dart';
import '../widgets/categoryItem.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        // padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                catData.id,
                catData.title,
                catData.color,
                catData.image,
              ),
            )
            .toList(),
        // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //   maxCrossAxisExtent: 200,
        //   childAspectRatio: 3 / 2,
        //   crossAxisSpacing: 20,
        //   mainAxisSpacing: 20,
        // ),
      ),
    );
  }
}
