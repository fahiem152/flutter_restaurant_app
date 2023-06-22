import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/data/models/request/register_request_model.dart';
import 'package:flutter_restaurant/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/register/register_bloc.dart';
import '../widgets/text_input_widget.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? nameController;
  TextEditingController? userNameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController!.dispose();
    userNameController!.dispose();
    emailController!.dispose();
    passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xffF9F9F9),
            Colors.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 4),
                Text(
                  'Daftar Akun',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                context.push(LoginPage.routeName);
              },
              child: const Center(
                child: Text.rich(TextSpan(
                  text: 'Sudah punya akun? ',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Masuk disini',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                )),
              ),
            ),
            const SizedBox(height: 42),
            const Text('Nama Lengkap',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 8,
            ),
            TextInputWidget(
              controller: nameController!,
              pleaceholder: 'Input Nama Lengkap',
              isPassword: false,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Username',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 8,
            ),
            TextInputWidget(
              controller: userNameController!,
              pleaceholder: 'Input Username',
              isPassword: false,
            ),
            const SizedBox(
              height: 20,
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
            const Text('Kata Sandi',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 8,
            ),
            TextInputWidget(
              controller: passwordController!,
              pleaceholder: 'Input Kata Sandi',
              isPassword: true,
            ),
            const SizedBox(
              height: 50,
            ),
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  loaded: (model) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(model.user.id.toString()),
                      ),
                    );
                    context.push(LoginPage.routeName);
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message.error.message),
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return ElevatedButton(
                      onPressed: () {
                        final registerModel = RegisterRequestModel(
                          name: nameController!.text,
                          password: passwordController!.text,
                          email: emailController!.text,
                          username: userNameController!.text,
                        );
                        context
                            .read<RegisterBloc>()
                            .add(RegisterEvent.register(registerModel));
                      },
                      child: const Text('Register'),
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
          ],
        ),
      ),
    );
  }
}
