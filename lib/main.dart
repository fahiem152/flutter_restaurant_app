import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_restaurant/bloc/get_by_id_restaurant/get_by_id_restaurant_bloc.dart';

import 'package:flutter_restaurant/bloc/login/login_bloc.dart';
import 'package:flutter_restaurant/bloc/navigation/navigation_bloc.dart';
import 'package:flutter_restaurant/bloc/register/register_bloc.dart';
import 'package:flutter_restaurant/data/local_datasource/auth_local_datasource.dart';
import 'package:flutter_restaurant/data/remote_datasource/auth_remote_datasource.dart';
import 'package:flutter_restaurant/data/remote_datasource/restaurant_remote_datasource.dart';
import 'package:flutter_restaurant/presentation/pages/add_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/detail_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/home_page.dart';
import 'package:flutter_restaurant/presentation/pages/login_page.dart';
import 'package:flutter_restaurant/presentation/pages/main_page.dart';
import 'package:flutter_restaurant/presentation/pages/my_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/register_page.dart';
import 'package:flutter_restaurant/presentation/pages/splash_page.dart';

import 'package:go_router/go_router.dart';

import 'bloc/create_restaurant/create_restaurant_bloc.dart';
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
        BlocProvider(
          create: (context) =>
              CreateRestaurantBloc(RestaurantRemoteDataSource()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routerConfig: GoRouter(
          initialLocation: LoginPage.routeName,
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
                path: MyRestaurantPage.routeName,
                builder: (context, state) => const MyRestaurantPage(),
                redirect: (context, state) async {
                  final isLogin = await AuthLocalDataSource().isLogin();
                  if (isLogin) {
                    return null;
                  } else {
                    return LoginPage.routeName;
                  }
                }),
            GoRoute(
              path: '${DetailRestaurantPage.routeName}/:idRestaurant',
              builder: (context, state) => DetailRestaurantPage(
                idRestaurant: int.parse(state.pathParameters['idRestaurant']!),
              ),
            ),
            GoRoute(
              path: SplashPage.routeName,
              builder: (context, state) => const SplashPage(),
            ),
            GoRoute(
              path: AddRestaurantPage.routeName,
              builder: (context, state) => const AddRestaurantPage(),
            ),
          ],
        ),
      ),
    );
  }
}
