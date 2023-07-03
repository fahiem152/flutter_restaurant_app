import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/common/color.constant.dart';
import 'package:flutter_restaurant/common/textstyle.constant.dart';
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
      body: ListView(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
                      'RegisterPage',
                      style: TextStyleConstant.h1.copyWith(
                        color: ColorConstant.red4,
                      ),
                    ),
                  ),
                  const Divider(
                    color: ColorConstant.grey,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Nama Lengkap',
                    style: TextStyleConstant.textSemiBold6.copyWith(
                      color: ColorConstant.black,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextInputWidget(
                    controller: nameController!,
                    pleaceholder: 'Input Nama Lengkap',
                    isPassword: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Username',
                    style: TextStyleConstant.textSemiBold6.copyWith(
                      color: ColorConstant.black,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextInputWidget(
                    controller: userNameController!,
                    pleaceholder: 'Input Username',
                    isPassword: false,
                  ),
                  const SizedBox(
                    height: 20,
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
                    height: 32,
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
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConstant.red,
                                elevation: 4,
                              ),
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
                              child: Text(
                                'Register',
                                style: TextStyleConstant.textSemiBold5,
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
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      context.push(LoginPage.routeName);
                    },
                    child: Center(
                      child: Text.rich(TextSpan(
                        text: 'Sudah punya akun? ',
                        style: TextStyleConstant.textReguler6.copyWith(
                          color: ColorConstant.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Masuk disini',
                            style: TextStyleConstant.textSemiBold6.copyWith(
                              color: ColorConstant.red4,
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
