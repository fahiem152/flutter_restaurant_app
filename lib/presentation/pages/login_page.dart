import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/bloc/login/login_bloc.dart';
import 'package:flutter_restaurant/data/models/request/login_request_model.dart';
import 'package:flutter_restaurant/presentation/pages/home_page.dart';
import 'package:flutter_restaurant/presentation/pages/main_page.dart';
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
        body: Padding(
      padding: const EdgeInsets.all(24),
      child: ListView(
        children: [
          const Center(
            child: Text('LoginPage'),
          ),
          const Text('Email',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              )),
          const SizedBox(
            height: 8,
          ),
          TextInputWidget(
            controller: emailController!,
            pleaceholder: 'Input Email',
            isPassword: false,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Kata Sandi',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 8,
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
                  return ElevatedButton(
                      onPressed: () {
                        final loginModel = LoginRequestModel(
                          identifier: emailController!.text,
                          password: passwordController!.text,
                        );
                        context
                            .read<LoginBloc>()
                            .add(LoginEvent.login(loginModel));
                      },
                      child: const Text('Login'));
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          ),
          ElevatedButton(
            onPressed: () => context.push(RegisterPage.routeName),
            child: Text(
              "Register",
            ),
          ),
        ],
      ),
    ));
  }
}
