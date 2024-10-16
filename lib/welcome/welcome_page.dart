import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(4.750587525867863, -74.10466518388438),
      tilt: 59.440717697143555,
      zoom: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bienvenido"),
        ),
        drawer: Drawer(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.88,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 15,
                            child: Container(
                              width: double.infinity,
                              child: TextField(),
                            )),
                        Expanded(
                            flex: 15,
                            child: Container(
                              width: double.infinity,
                              child: TextField(),
                            )),
                        Expanded(
                            flex: 85,
                            child: Container(
                              width: double.infinity,
                              child: GoogleMap(
                                mapType: MapType.normal,
                                initialCameraPosition: _kGooglePlex,
                                onMapCreated: (GoogleMapController controller) {
                                  _controller.complete(controller);
                                },
                              ),
                            )),
                        Expanded(
                            flex: 25,
                            child: Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: _goToTheLake,
                                  child: Text("Empezar")),
                            ))
                      ],
                    )))));
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
