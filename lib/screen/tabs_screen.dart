// import 'package:flutter/material.dart';
// import './favourites_screen.dart';
// import './catagories_screen.dart';

// // this will only manage the tabs and load different screens on the basis
// // of the tabs selected
// class TabsScreen extends StatefulWidget {
//   // const TabsScreen({Key? key}) : super(key: key);

//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       // initialIndex: 0,
//       // the initialIndex is basically the primary tab selected
//       // by default 0,
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: const TabBar(tabs: [
//             Tab(
//               icon: Icon(
//                 Icons.category,
//               ),
//               text: 'Categories',
//             ),
//             Tab(
//               icon: Icon(
//                 Icons.star,
//               ),
//               text: 'Favourites',
//             )
//           ]),
//         ),
//         body: TabBarView(
//           children: [
//             CatagoriesScreen(),
//             FavouriteScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
