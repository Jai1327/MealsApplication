import 'package:flutter/material.dart';
import 'dummy_data.dart';
import './model/meal.dart';
import './screen/fliter_screen.dart';
// import './screen/tabs_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/catagories_meals_screen.dart';
import './screen/catagories_screen.dart';
import './screen/bottom_tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'veg': false,
    'vegan': false
  };
  List<Meal> _availableMeals = [];
  List<Meal> favourtieMeals = [];

  // this method is to be called from inside the filter's screen
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['veg'] == true && !meal.isVeg) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealID) {
    final existingIndex =
        favourtieMeals.indexWhere((meal) => meal.id == mealID);
    if (existingIndex >= 0) {
      setState(() {
        favourtieMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favourtieMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool isMealFavourite(String mealID) {
    return (favourtieMeals.any((element) => element.id == mealID));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        // this colorScheme is a new way to display color swatches
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: TextTheme(
          // titleLarge: TextStyle(fontFamily: 'RobotoCondensed'),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
        ),
        // textTheme: TextTheme(
        //   bodyText1: TextStyle(
        //     color: Color.fromRGBO(20, 51, 51, 1),
        //   ),
        //   bodyText2: TextStyle(
        //     color: Color.fromRGBO(20, 51, 51, 1),
        //   ),
        //   titleLarge: TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
        // ),
      ),
      // home: CatagoriesScreen(),

      initialRoute: '/', // this can be changes inorder to use another page
      // for the intial page
      routes: {
        '/': (context) => BottomTabsScreen(favourtieMeals),
        catagoryMealsScreen.routeName: (context) =>
            catagoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(toggleFavourite, isMealFavourite),
        FilterScreen.routeName: (context) =>
            FilterScreen(_setFilters, _filters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (_) => CatagoriesScreen(),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CatagoriesScreen());
      },
    );
  }
}


// this is not not required as catagory Screen is the initial home page
// class MyHomePage extends StatefulWidget {
//   // const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("DeliMeals"),
//       ),
//       body: Center(
//         child: Text("Navigation time!"),
//       ),
//     );
//   }
// }
