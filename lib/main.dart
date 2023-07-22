import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_restaurant/bloc/get_by_id_restaurant/get_by_id_restaurant_bloc.dart';
import 'package:flutter_restaurant/bloc/get_location/get_location_bloc.dart';
import 'package:flutter_restaurant/bloc/get_restaurant_by_uesr_id/get_restaurant_by_user_id_bloc.dart';
import 'package:flutter_restaurant/bloc/get_search_restaurant/get_search_restaurant_bloc.dart';
import 'package:flutter_restaurant/bloc/get_user_by_id/get_user_by_id_bloc.dart';
import 'package:flutter_restaurant/bloc/gmap/gmap_bloc.dart';

import 'package:flutter_restaurant/bloc/login/login_bloc.dart';
import 'package:flutter_restaurant/bloc/navigation/navigation_bloc.dart';
import 'package:flutter_restaurant/bloc/register/register_bloc.dart';
import 'package:flutter_restaurant/bloc/update_restaurant/update_restaurant_bloc.dart';
import 'package:flutter_restaurant/data/local_datasource/auth_local_datasource.dart';
import 'package:flutter_restaurant/data/remote_datasource/auth_remote_datasource.dart';
import 'package:flutter_restaurant/data/remote_datasource/gmap_remote_datasource.dart';
import 'package:flutter_restaurant/data/remote_datasource/location_remote_datasource.dart';
import 'package:flutter_restaurant/data/remote_datasource/restaurant_remote_datasource.dart';
import 'package:flutter_restaurant/data/remote_datasource/user_remote_datasource.dart';
import 'package:flutter_restaurant/presentation/pages/add_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/detail_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/home_page.dart';
import 'package:flutter_restaurant/presentation/pages/login_page.dart';

import 'package:flutter_restaurant/presentation/pages/my_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/profile_page.dart';
import 'package:flutter_restaurant/presentation/pages/register_page.dart';
import 'package:flutter_restaurant/presentation/pages/search_page.dart';
import 'package:flutter_restaurant/presentation/pages/splash_page.dart';
import 'package:flutter_restaurant/presentation/pages/update_profile_page.dart';
import 'package:flutter_restaurant/presentation/pages/update_restaurant_page.dart';

import 'package:go_router/go_router.dart';

import 'bloc/create_restaurant/create_restaurant_bloc.dart';
import 'bloc/delete_restaurant/delete_resataurant_bloc.dart';
import 'bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import 'bloc/update_profile/update_profile_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        BlocProvider(
          create: (context) =>
              GetRestaurantByUserIdBloc(RestaurantRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => GetLocationBloc(LocationRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) =>
              GetSearchRestaurantBloc(RestaurantRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => GetUserByIdBloc(UserRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => GmapBloc(GmapDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              DeleteResataurantBloc(RestaurantRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) =>
              UpdateRestaurantBloc(RestaurantRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => UpdateProfileBloc(UserRemoteDataSource()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(
          initialLocation: SplashPage.routeName,
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
            // GoRoute(
            //   path: MainPage.routeName,
            //   builder: (context, state) => const MainPage(),
            // ),
            GoRoute(
              path: MyRestaurantPage.routeName,
              builder: (context, state) => const MyRestaurantPage(),
              redirect: (context, state) async {
                final isLogin = await AuthLocalDataSource().isLogin();
                debugPrint('isLogin: $isLogin');
                if (isLogin) {
                  return null;
                } else {
                  return LoginPage.routeName;
                }
              },
            ),
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

            GoRoute(
              path: SearchPage.routeName,
              builder: (context, state) => const SearchPage(),
            ),

            GoRoute(
              path: ProfilePage.routeName,
              builder: (context, state) => const ProfilePage(),
              redirect: (context, state) async {
                final isLogin = await AuthLocalDataSource().isLogin();
                debugPrint('isLogin: $isLogin');
                if (isLogin) {
                  return null;
                } else {
                  return LoginPage.routeName;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
