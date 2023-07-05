import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/bloc/login/login_bloc.dart';
import 'package:flutter_restaurant/common/color.constant.dart';
import 'package:flutter_restaurant/common/textstyle.constant.dart';
import 'package:flutter_restaurant/data/models/request/login_request_model.dart';
import 'package:flutter_restaurant/presentation/pages/home_page.dart';

import 'package:flutter_restaurant/presentation/pages/register_page.dart';

import 'package:go_router/go_router.dart';

import '../../data/local_datasource/auth_local_datasource.dart';
import '../widgets/text_input_widget.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    emailController!.dispose();
    passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: 0,
                offset: const Offset(0, 1),
                color: Colors.black.withOpacity(0.2),
              ),
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 0,
                offset: const Offset(0, 2),
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'LoginPage',
                  style: TextStyleConstant.h1.copyWith(
                    color: ColorConstant.red4,
                  ),
                ),
              ),
              const Divider(
                color: ColorConstant.grey,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Email Address',
                style: TextStyleConstant.textSemiBold6.copyWith(
                  color: ColorConstant.black,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextInputWidget(
                controller: emailController!,
                pleaceholder: 'Input Email',
                isPassword: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                style: TextStyleConstant.textSemiBold6.copyWith(
                  color: ColorConstant.black,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextInputWidget(
                controller: passwordController!,
                pleaceholder: 'Input Kata Sandi',
                isPassword: true,
              ),
              const SizedBox(
                height: 24,
              ),
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    error: (message) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message.error.message),
                        ),
                      );
                    },
                    loaded: (model) {
                      AuthLocalDataSource().saveAuthData(model);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(model.user.id.toString()),
                        ),
                      );
                      context.push(HomePage.routeName);
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstant.red,
                            elevation: 4,
                          ),
                          onPressed: () {
                            final loginModel = LoginRequestModel(
                              identifier: emailController!.text,
                              password: passwordController!.text,
                            );
                            context
                                .read<LoginBloc>()
                                .add(LoginEvent.login(loginModel));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Login',
                              style: TextStyleConstant.textSemiBold5,
                            ),
                          ),
                        ),
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.red4,
                    elevation: 4,
                  ),
                  onPressed: () => context.push(RegisterPage.routeName),
                  child: Text(
                    "Register",
                    style: TextStyleConstant.textReguler6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
