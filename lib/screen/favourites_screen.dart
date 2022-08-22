import 'package:flutter/material.dart';

import '../widget/meal_item.dart';
import '../model/meal.dart';

class FavouriteScreen extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);
  final List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Scaffold(
        body: Text("No Favourites Selected"),
      );
    } else {
      return Scaffold(
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favouriteMeals[index].id,
              ImageUrl: favouriteMeals[index].ImageUrl,
              affordability: favouriteMeals[index].affordability,
              complexity: favouriteMeals[index].complexity,
              duration: favouriteMeals[index].duration,
              title: favouriteMeals[index].title,
              // removeItem: () {},
            );
          },
          itemCount: favouriteMeals.length,
        ),
      );
    }
  }
}
