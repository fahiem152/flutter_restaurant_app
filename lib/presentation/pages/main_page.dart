// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_restaurant/bloc/navigation/navigation_bloc.dart';
// import 'package:flutter_restaurant/data/local_datasource/auth_local_datasource.dart';
// import 'package:flutter_restaurant/presentation/pages/home_page.dart';
// import 'package:flutter_restaurant/presentation/pages/login_page.dart';
// import 'package:flutter_restaurant/presentation/pages/my_restaurant_page.dart';

// class MainPage extends StatefulWidget {
//   static const routeName = '/main-page';
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<NavigationBloc>().add(NavigationEvent.navIndex(0));
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget bottomNavigationBar() {
//       return BlocBuilder<NavigationBloc, NavigationState>(
//         builder: (context, state) {
//           return BottomNavigationBar(
//             onTap: (index) {
//               context
//                   .read<NavigationBloc>()
//                   .add(NavigationEvent.navIndex(index));
//             },
//             items: <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: const Icon(Icons.home),
//                 label: state.maybeMap(
//                   navigationIndex: (value) => value.index == 0 ? 'Home' : '',
//                   orElse: () => '',
//                 ),
//               ),
//               BottomNavigationBarItem(
//                 icon: const Icon(Icons.format_list_bulleted),
//                 label: state.maybeMap(
//                   navigationIndex: (value) =>
//                       value.index == 1 ? 'My Restaurant' : '',
//                   orElse: () => '',
//                 ),
//               ),
//             ],
//             currentIndex: state.maybeMap(
//               navigationIndex: (value) => value.index,
//               orElse: () => 0,
//             ),
//           );
//         },
//       );
//     }

//     return Scaffold(
//       bottomNavigationBar: bottomNavigationBar(),
//       body: SafeArea(child: BlocBuilder<NavigationBloc, NavigationState>(
//         builder: (context, state) {
//           return IndexedStack(
//             index: state.maybeMap(
//               navigationIndex: (value) => value.index,
//               orElse: () => 0,
//             ),
//             children: [
//               HomePage(),
//               MyRestaurantPage(),
//             ],
//           );
//         },
//       )),
//       // body: SafeArea(child: BlocBuilder<NavigationBloc, NavigationState>(
//       //   builder: (context, state) {
//       //     return IndexedStack(
//       //       index: state.maybeMap(
//       //         navigationIndex: (value) => value.index,
//       //         orElse: () => 0,
//       //       ),
//       //       children: [
//       //         HomePage(),
//       //         MyRestaurantPage(),
//       //       ],
//       //     );
//       //   },
//       // )),
//     );
//   }
// }
