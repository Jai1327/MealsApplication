import 'package:flutter/material.dart';
import '../widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  // const FilterScreen({Key? key}) : super(key: key);

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.saveFilters, this.currentFilters);

  static const routeName = '/filters';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isGlutenFree = false;
  var isVeg = false;
  var isVegan = false;
  var isLactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    isGlutenFree = widget.currentFilters['gluten'] as bool;
    isVeg = widget.currentFilters['veg'] as bool;
    isVegan = widget.currentFilters['vegan'] as bool;
    isLactoseFree = widget.currentFilters['lactose'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool flag,
    Function updateValue,
  ) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: flag,
      onChanged: (newValue) => updateValue(newValue),
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': isGlutenFree,
                  'lactose': isLactoseFree,
                  'veg': isVeg,
                  'vegan': isVegan
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection",
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Expanded(
            child: ListView(
              children: [
                // SwitchListTile(
                //   value: isLactoseFree,
                //   onChanged: (newValue) {
                //     setState(() {
                //       isLactoseFree = newValue;
                //     });
                //   },
                //   title: Text("Lactose-Free"),
                //   subtitle: Text("Only include lactose Free"),
                // ),
                _buildSwitchListTile(
                  "Lactose-Free",
                  "Only include lactose free meals",
                  isLactoseFree,
                  (newValue) {
                    setState(
                      () {
                        isLactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  "Veg only",
                  "Only include veg meals",
                  isVeg,
                  (newValue) {
                    setState(
                      () {
                        isVeg = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  "Vegan only",
                  "Only include vegan meals",
                  isVegan,
                  (newValue) {
                    setState(
                      () {
                        isVegan = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  "Gluten-Free",
                  "Only include gluten free meals",
                  isGlutenFree,
                  (newValue) {
                    setState(
                      () {
                        isGlutenFree = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
