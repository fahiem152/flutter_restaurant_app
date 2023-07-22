// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/bloc/update_profile/update_profile_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/login/login_bloc.dart';
import '../../common/color.constant.dart';
import '../../common/textstyle.constant.dart';
import '../../data/models/request/update_user_request_model.dart';
import '../../data/models/response/auth_response_model.dart';
import '../widgets/text_input_widget.dart';

class UpdateProfilePage extends StatefulWidget {
  final User user;

  const UpdateProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.user.email);
    userNameController = TextEditingController(text: widget.user.username);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    userNameController.dispose();
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
                  'Update Profile',
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
                controller: emailController,
                pleaceholder: 'Input Email Baru',
                isPassword: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'UserName',
                style: TextStyleConstant.textSemiBold6.copyWith(
                  color: ColorConstant.black,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              TextInputWidget(
                controller: userNameController,
                pleaceholder: 'Input UserName Baru',
                isPassword: false,
              ),
              const SizedBox(
                height: 24,
              ),
              BlocConsumer<UpdateProfileBloc, UpdateProfileState>(
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Update Profile Success'),
                        ),
                      );
                      context.pop();
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
                            final updateModel = UpdateUserRequestModel(
                              email: emailController.text,
                              username: userNameController.text,
                            );
                            context
                                .read<UpdateProfileBloc>()
                                .add(UpdateProfileEvent.updateProfile(
                                  updateModel,
                                  widget.user.id,
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Update',
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
            ],
          ),
        ),
      ],
    ));
  }
}
