import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widget/catagory_item.dart';

class CatagoriesScreen extends StatelessWidget {
  const CatagoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        // this is used to primarily set the boundaries of the grid
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2, // for 200 width, 300 height
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (e) => CategoryItems(
              title: e.title,
              color: e.color,
              id: e.id,
            ),
          )
          .toList(),
    );
  }
}
