import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/bloc/get_restaurant_by_uesr_id/get_restaurant_by_user_id_bloc.dart';
import 'package:flutter_restaurant/data/local_datasource/auth_local_datasource.dart';
import 'package:flutter_restaurant/data/models/response/restaurants_response_model.dart';
import 'package:flutter_restaurant/presentation/pages/add_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/detail_restaurant_page.dart';
import 'package:flutter_restaurant/presentation/pages/home_page.dart';
import 'package:flutter_restaurant/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';

class MyRestaurantPage extends StatefulWidget {
  static const routeName = '/my-restaurant';
  const MyRestaurantPage({super.key});

  @override
  State<MyRestaurantPage> createState() => _MyRestaurantPageState();
}

class _MyRestaurantPageState extends State<MyRestaurantPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<GetRestaurantByUserIdBloc>()
        .add(GetRestaurantByUserIdEvent.getRestaurantByUserId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Restaurant'),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthLocalDataSource().removeAuthData();
                context.go(LoginPage.routeName);
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AddRestaurantPage.routeName);
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: BlocBuilder<GetRestaurantByUserIdBloc,
                GetRestaurantByUserIdState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (message) => Center(
                    child: Text(message.error.message),
                  ),
                  loaded: (data) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return RestaurantCard(data: data.data[index]);
                      },
                      itemCount: data.data.length,
                    );
                  },
                );
              },
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        onTap: (value) {
          if (value == 0) {
            context.push(HomePage.routeName);
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant), label: 'All Restaurant'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'My Account'),
        ],
      ),
    );

    // return Center(
    //   child: IconButton(
    //     onPressed: () {
    //       context.push(AddRestaurantPage.routeName);
    //     },
    //     icon: const Icon(
    //       Icons.add_circle_outline_rounded,
    //       color: Colors.blue,
    //       size: 32,
    //     ),
    //   ),
    // );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Restaurant data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('${DetailRestaurantPage.routeName}/${data.id}'),
      child: Card(
        child: ListTile(
          title: Text(data.attributes.name),
          subtitle: Text(data.attributes.description),
          leading: CircleAvatar(
            radius: 18,
            child: Image.network(
                data.attributes.photo ?? 'https://picsum.photos/200/300'),
          ),
        ),
      ),
    );
  }
}
