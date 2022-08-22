import 'package:flutter/material.dart';
import '../screen/catagories_screen.dart';
import '../screen/catagories_meals_screen.dart';

class CategoryItems extends StatelessWidget {
  // const CategoryItems({Key? key}) : super(key: key);

  final String id;
  final String title;
  final Color color;

  CategoryItems(
      {this.color = Colors.orange, required this.title, required this.id});

  void selectCatagory(BuildContext context) {
    Navigator.of(context).pushNamed(
      catagoryMealsScreen.routeName,
      arguments: {'id': id, 'title': title},
    );
    // materialPageRoute is a wrapper that takes care of all the animation
  }
  // void selectCatagory(BuildContext context) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (c) {
  //         return catagoryMealsScreen(title, id);
  //       },
  //     ),
  //   );
  //   // materialPageRoute is a wrapper that takes care of all the animation
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCatagory(context),
      // below used to make changes to the ripple effect
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          // style: Theme.of(context).textTheme.titleLarge,
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold),
        ),
        // color: color,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
