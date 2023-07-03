import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/color.constant.dart';
import 'package:flutter_restaurant/common/textstyle.constant.dart';
import 'package:flutter_restaurant/data/local_datasource/auth_local_datasource.dart';
import 'package:flutter_restaurant/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash_page';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  getInt() async {
    final token = await AuthLocalDataSource().getToken();
    debugPrint('token: $token');
    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        context.go(HomePage.routeName);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/pattern.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text('Restaurant App',
                          style: TextStyleConstant.h1.copyWith(
                            color: ColorConstant.red,
                          ))
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
