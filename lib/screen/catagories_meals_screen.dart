import 'package:flutter/material.dart';
import 'package:meals/model/catagory.dart';
import 'package:meals/widget/meal_item.dart';
// import './model/meal.dart';
import '../dummy_data.dart';
import '../model/meal.dart';

class catagoryMealsScreen extends StatefulWidget {
  static const routeName = '/catagory_meal';
  // this can be accessed from the outside

  final List<Meal> availableMeals;
  catagoryMealsScreen(this.availableMeals);

  @override
  State<catagoryMealsScreen> createState() => _catagoryMealsScreenState();
}

class _catagoryMealsScreenState extends State<catagoryMealsScreen> {
  late String CategoryTitle;
  late List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
    // final routeArgs =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    // CategoryTitle = routeArgs['title'] as String;
    // final String categoryID = routeArgs['id'] as String;

    // displayedMeals = DUMMY_MEALS.where((meal) {
    //   return meal.catagoryID.contains(categoryID);
    // }).toList();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      CategoryTitle = routeArgs['title'] as String;
      final String categoryID = routeArgs['id'] as String;

      displayedMeals = widget.availableMeals.where((meal) {
        return meal.catagoryID.contains(categoryID);
      }).toList();
      _loadedInitData = true;
    }
  }

  void _removeMeal(String mealID) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(CategoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              ImageUrl: displayedMeals[index].ImageUrl,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
              title: displayedMeals[index].title,
              // removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
