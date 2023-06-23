import 'package:flutter_bloc/flutter_bloc.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/bloc/get_by_id_restaurant/get_by_id_restaurant_bloc.dart';

class DetailRestaurantPage extends StatefulWidget {
  final int idRestaurant;
  static const routeName = '/detai_restaurant';
  const DetailRestaurantPage({
    Key? key,
    required this.idRestaurant,
  }) : super(key: key);

  @override
  State<DetailRestaurantPage> createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  @override
  void initState() {
    context
        .read<GetByIdRestaurantBloc>()
        .add(GetByIdRestaurantEvent.getByIdRestaurant(widget.idRestaurant));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('idRestaurant ' + widget.idRestaurant.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Restaurant'),
      ),
      body: BlocBuilder<GetByIdRestaurantBloc, GetByIdRestaurantState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return Center(child: CircularProgressIndicator());
            },
            loaded: (model) {
              return Center(
                child: Text(model.data.attributes.name),
              );
            },
            error: (message) {
              return Text(message);
            },
          );
        },
      ),
    );
  }
}
