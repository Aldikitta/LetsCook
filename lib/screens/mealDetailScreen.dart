import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummyData.dart';
import '../constants.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              // height: size.height,

              child: Stack(
                children: <Widget>[
                  Container(
                    // height: 300,
                    width: double.infinity,
                    child: Image.network(
                      selectedMeal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.32),
                    padding: EdgeInsets.only(
                      top: size.height * 0.05,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    // height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BuildSectionTile(selectedMeal: selectedMeal),
                        SizedBox(height: 100),
                        BuildSectionContainer(selectedMeal: selectedMeal),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}

class BuildSectionContainer extends StatelessWidget {
  const BuildSectionContainer({
    Key key,
    this.text,
    @required this.selectedMeal,
  }) : super(key: key);

  final Meal selectedMeal;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xffFBE5E7),
              Color(0xFFFFC1C6),
            ],
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(
            'Steps',
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            height: 500,
            child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(
                            selectedMeal.steps[index],
                          ),
                        ),
                        Divider()
                      ],
                    ),
                itemCount: selectedMeal.steps.length),
          ),
        ],
      ),
    );
  }
}

class BuildSectionTile extends StatelessWidget {
  const BuildSectionTile({
    Key key,
    @required this.selectedMeal,
  }) : super(key: key);

  final Meal selectedMeal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xffFBE5E7),
              Color(0xFFFFC1C6),
            ],
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            height: 300,
            child: ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      selectedMeal.ingredients[index],
                    ),
                  ),
                  // Divider()
                ],
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
        ],
      ),
    );
  }
}
