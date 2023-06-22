import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/bloc/get_by_id_restaurant/get_by_id_restaurant_bloc.dart';

import 'package:flutter_restaurant/bloc/login/login_bloc.dart';
import 'package:flutter_restaurant/bloc/navigation/navigation_bloc.dart';
import 'package:flutter_restaurant/bloc/register/register_bloc.dart';
import 'package:flutter_restaurant/data/remote_datasource/auth_remote_datasource.dart';
import 'package:flutter_restaurant/data/remote_datasource/restaurant_remote_datasource.dart';
import 'package:flutter_restaurant/presentation/pages/detail_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/home_page.dart';
import 'package:flutter_restaurant/presentation/pages/login_page.dart';
import 'package:flutter_restaurant/presentation/pages/main_page.dart';
import 'package:flutter_restaurant/presentation/pages/register_page.dart';

import 'package:go_router/go_router.dart';

import 'bloc/get_all_restaurant/get_all_restaurant_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(AuthRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) =>
              GetAllRestaurantBloc(RestaurantRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) =>
              GetByIdRestaurantBloc(RestaurantRemoteDataSource()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routerConfig: GoRouter(
          initialLocation: RegisterPage.routeName,
          routes: [
            GoRoute(
              path: LoginPage.routeName,
              builder: (context, state) => const LoginPage(),
            ),
            GoRoute(
              path: RegisterPage.routeName,
              builder: (context, state) => const RegisterPage(),
            ),
            GoRoute(
              path: HomePage.routeName,
              builder: (context, state) => const HomePage(),
            ),
            GoRoute(
              path: MainPage.routeName,
              builder: (context, state) => const MainPage(),
            ),
            GoRoute(
              path: MainPage.routeName,
              builder: (context, state) => const MainPage(),
            ),
            GoRoute(
              path: DetailRestaurant.routeName,
              builder: (context, state) =>
                  const DetailRestaurant(idRestaurant: 1),
            ),
          ],
        ),
      ),
    );
  }
}
