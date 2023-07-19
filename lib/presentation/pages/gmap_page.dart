import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/bloc/gmap/gmap_bloc.dart';
import 'package:flutter_restaurant/common/color.constant.dart';
import 'package:flutter_restaurant/common/textstyle.constant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GmapPage extends StatefulWidget {
  const GmapPage({
    Key? key,
    required this.lat,
    required this.long,
  }) : super(key: key);
  final double lat;
  final double long;

  @override
  State<GmapPage> createState() => _GmapPageState();
}

class _GmapPageState extends State<GmapPage> {
  final TextEditingController addressController = TextEditingController();
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};

  void _createInitialMarker() {
    final marker = Marker(
      markerId: const MarkerId("position"),
      position: LatLng(widget.lat, widget.long),
    );
    print('Awawl: lat: ${widget.lat}, long: ${widget.long}');
    _markers.add(marker);
  }

  void setNewMarker({required double lat, required double long}) async {
    print('ini marker sebelum di clear: ' + _markers.toString());
    _markers.clear();
    print('ini marker setelah di clear: ' + _markers.toString());
    final marker = Marker(
      markerId: const MarkerId("position"),
      position: LatLng(lat, long),
    );

    _markers.add(marker);
    print('ini new marker: ' + _markers.toString());

    _mapController.animateCamera(
      CameraUpdate.newLatLngZoom(LatLng(lat, long), 15),
    );

    context.read<GmapBloc>().add(GmapEvent.getSelectPosition(lat, long));

    setState(() {});
  }

  void mapController(GoogleMapController value) {
    _mapController = value;
  }

  @override
  void initState() {
    _createInitialMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.red,
        title: const Text('Ganti Lokasi'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.check_box),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.lat, widget.long),
            ),
            markers: _markers,
            onMapCreated: (controller) {
              mapController(controller);
            },
            onTap: (argument) {
              setNewMarker(
                lat: argument.latitude,
                long: argument.longitude,
              );
              print(
                  'Baru lat: ${argument.latitude}, long: ${argument.longitude}');
            },
          ),
          BlocBuilder<GmapBloc, GmapState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'No Address',
                    style: TextStyleConstant.textBold5.copyWith(
                      color: ColorConstant.red2,
                    ),
                  ),
                ),
                loaded: (model) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      model.address ?? '',
                      style: TextStyleConstant.textBold5.copyWith(
                        color: ColorConstant.red2,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
