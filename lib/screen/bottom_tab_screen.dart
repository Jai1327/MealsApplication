import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../widget/main_drawer.dart';
import './favourites_screen.dart';
import './catagories_screen.dart';

// this will only manage the tabs and load different screens on the basis
// of the tabs selected
class BottomTabsScreen extends StatefulWidget {
  // const TabsScreen({Key? key}) : super(key: key);
  List<Meal> favouriteMeals;
  BottomTabsScreen(this.favouriteMeals);

  @override
  State<BottomTabsScreen> createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  late List<Widget> _pages;

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      CatagoriesScreen(),
      FavouriteScreen(widget.favouriteMeals),
    ];
    super.initState();
  }

  int selectedPageIndex = 0;

  final List<Widget> _titles = [
    Text("Meals"),
    Text("Favourites"),
  ];
  void _selectPage(int index) {
    //this index will be automatically passed by flutter
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _titles[selectedPageIndex],
      ),
      drawer: MainDrawer(),
      body: _pages[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.category),
            label: "categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.star),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
