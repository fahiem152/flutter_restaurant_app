import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/presentation/pages/main_page.dart';
import 'package:go_router/go_router.dart';

import '../../data/local_datasource/auth_local_datasource.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash_page';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void checkAuth() async {
    final auth = await AuthLocalDataSource().getToken();
    await Future.delayed(const Duration(milliseconds: 1000));
    if (kDebugMode) {
      print('token: $auth');
    }
    context.push(MainPage.routeName);
  }

  initState() {
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Text(
          'E-Catalog App',
          style: TextStyle(
            fontSize: 32,
            color: Theme.of(context).colorScheme.onPrimary,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
