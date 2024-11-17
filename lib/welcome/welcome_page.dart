import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:etp/constants/constants.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:google_places_autocomplete_text_field/model/prediction.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mtk;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:etp/shared/permission_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_routes/google_maps_routes.dart';
import 'package:permission_handler/permission_handler.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with WidgetsBindingObserver {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  String _darkMapStyle = "";
  StreamSubscription<Position>? _positionStream;
  final CameraPosition _cameraPos = const CameraPosition(
    target: LatLng(4.678390790862425, -74.0789827067201),
    zoom: 12,
  );
  List<Marker> markerList = [];
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  Marker _destinationMarker = const Marker(
      markerId: MarkerId("destination"),
      position: const LatLng(4.729116356867422, -74.04060057469925));
  Position? _currentPosition;
  mtk.LatLng? _firePosition;
  List<Polyline> myRouteList = [];
  MapsRoutes route = MapsRoutes();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  Marker? myLocationMarker;

  final _textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setCustomIconForUserLocation();
      destinationIconAsset();
      _loadMapStyles().then((_) {
        if (mounted) setState(() {});
      });
      checkPermissionAndListenLocation();
    });


    //Timer(
      //const Duration(milliseconds: 120000),
        //  () async {
        //_showMyDialog();
      //},
    //);

    checkPermissionAndListenLocation();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_positionStream != null) _positionStream!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("====>>>>> my routes ${myRouteList}");
    return Scaffold(
      /*
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.grey[850],
          onPressed: () {
            getNewRouteFromAPI();
          },
          label: Text(
            "Get Route",
            style: TextStyle(color: Colors.grey[300]),
          ),
        ),*/
        appBar: AppBar(
          title: const Text("Emergencias"),
        ),
        body: PermissionProvider.locationPermission !=
            PermissionStatus.granted ||
            _darkMapStyle.isEmpty
            ? Container(
            color: Colors.grey[700],
            child: const Center(child: CircularProgressIndicator()))
            : SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.87,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: GooglePlacesAutoCompleteTextFormField(
                        textEditingController: _textController,
                        googleAPIKey:
                        "AIzaSyBX-8AvLmGMqwsA9e3a8rQoLW1QZ0TLIi4",
                        decoration: const InputDecoration(
                          hintText: 'Destino',
                          labelText: 'Dirección',
                          labelStyle: TextStyle(color: Colors.teal),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        // proxyURL: _yourProxyURL,
                        maxLines: 1,
                        overlayContainer: (child) => Material(
                          elevation: 1.0,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          child: child,
                        ),
                        getPlaceDetailWithLatLng: (prediction) {
                          print('placeDetails${prediction.lng}');
                          _firePosition = mtk.LatLng(
                              double.parse(prediction.lat ?? "0.0"),
                              double.parse(prediction.lng ?? "0.0"));
                          setState(() {
                            destinationFire(
                                double.parse(prediction.lat ?? "0.0"),
                                double.parse(prediction.lng ?? "0.0"));
                          });
                        },
                        itmClick: (Prediction prediction) =>
                        _textController.text =
                        prediction.description!,
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: GoogleMap(
                        polylines: Set<Polyline>.from(myRouteList),
                        initialCameraPosition: _cameraPos,
                        markers: Set<Marker>.from(markerList),
                        onMapCreated: (GoogleMapController controller) {
                          if (!_controller.isCompleted) {
                            _controller.complete(controller);
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            getNewRouteFromAPI();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Color.fromRGBO(88, 147, 138, 1),
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                  child: Icon(
                                    Icons.start_outlined,
                                    color: Colors.white,
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Text(
                                      "Comenzar",
                                      textAlign: TextAlign.justify,
                                      style:
                                      TextStyle(color: Colors.white),
                                    ),
                                  )),
                              Spacer(),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> _showMyDialog() async {
    // Muestra el diálogo
    await showDialog<void>(
      context: context,
      barrierDismissible: false, // El usuario no puede cerrar el diálogo tocando fuera de él
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Activando semáforo'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Se ha enviado una solicitud de activación de semáforo'),
                // Puedes agregar más detalles si lo deseas
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    // Espera 5 segundos antes de cerrar el diálogo
    await Future.delayed(Duration(seconds: 5));

    // Cierra el diálogo si está abierto
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop();
    }
  }

  void setCustomIconForUserLocation() {
    Future<Uint8List> getBytesFromAsset(String path, int width) async {
      ByteData data = await rootBundle.load(path);
      Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
          targetWidth: width);
      FrameInfo fi = await codec.getNextFrame();
      return (await fi.image.toByteData(format: ImageByteFormat.png))!
          .buffer
          .asUint8List();
    }

    getBytesFromAsset('assets/user_location.png', 80).then((onValue) {
      markerIcon = BitmapDescriptor.fromBytes(onValue);
    });
  }

  void destinationFire(double lat, double lgn) {
    Future<Uint8List> getBytesFromAsset(String path, int width) async {
      ByteData data = await rootBundle.load(path);
      Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
          targetWidth: width);
      FrameInfo fi = await codec.getNextFrame();
      return (await fi.image.toByteData(format: ImageByteFormat.png))!
          .buffer
          .asUint8List();
    }

    getBytesFromAsset('assets/fire.png', 80).then((onValue) {
      destinationIcon = BitmapDescriptor.fromBytes(onValue);
      _destinationMarker = Marker(
          markerId: MarkerId("fire_destination"),
          icon: destinationIcon,
          position: LatLng(lat, lgn));

      markerList.add(_destinationMarker);
    });
  }

  void destinationIconAsset() {
    Future<Uint8List> getBytesFromAsset(String path, int width) async {
      ByteData data = await rootBundle.load(path);
      Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
          targetWidth: width);
      FrameInfo fi = await codec.getNextFrame();
      return (await fi.image.toByteData(format: ImageByteFormat.png))!
          .buffer
          .asUint8List();
    }
// CHANGE LUISA
// Se comentan las líneas que pintan la estación de bomberos

    //getBytesFromAsset('assets/fire_station.png', 80).then((onValue) {
    //destinationIcon = BitmapDescriptor.fromBytes(onValue);
    //_destinationMarker = Marker(
    //  markerId: MarkerId("destination"),
    // icon: destinationIcon,
    // position: const LatLng(4.729116356867422, -74.04060057469925));

    //markerList.add(_destinationMarker);
    //});

    getBytesFromAsset('assets/traffic_lights.png', 80).then((onValue) {
      var trafficicon = BitmapDescriptor.fromBytes(onValue);

      markerList.add(Marker(
          markerId: const MarkerId("1"),
          icon: trafficicon,
          position: const LatLng(4.74909895300004, -74.053392908)));
      markerList.add(Marker(
          markerId: const MarkerId("2"),
          icon: trafficicon,
          position: const LatLng(4.73849360800006, -74.0596821669999)));

      markerList.add(Marker(
          markerId: const MarkerId("3"),
          icon: trafficicon,
          position: const LatLng(4.73842996200005, -74.0519718039999)));

      markerList.add(Marker(
          markerId: const MarkerId("4"),
          icon: trafficicon,
          position: const LatLng(4.73523770000003, -74.052515281)));

      markerList.add(Marker(
          markerId: const MarkerId("5"),
          icon: trafficicon,
          position: const LatLng(4.73635158000008, -74.06212821)));

      markerList.add(Marker(
          markerId: const MarkerId("6"),
          icon: trafficicon,
          position: const LatLng(4.73635158000008, -74.065202342)));

      markerList.add(Marker(
          markerId: const MarkerId("7"),
          icon: trafficicon,
          position: const LatLng(4.73585474400005, -74.057888493)));

      markerList.add(Marker(
          markerId: const MarkerId("8"),
          icon: trafficicon,
          position: const LatLng(4.74026086100002, -74.059539389)));

      markerList.add(Marker(
          markerId: const MarkerId("9"),
          icon: trafficicon,
          position: const LatLng(4.73606103600002, -74.0599191859999)));

      markerList.add(Marker(
          markerId: const MarkerId("10"),
          icon: trafficicon,
          position: const LatLng(4.73900675300007, -74.054482086)));

      markerList.add(Marker(
          markerId: const MarkerId("11"),
          icon: trafficicon,
          position: const LatLng(4.74939253000002, -74.056427916)));

      markerList.add(Marker(
          markerId: const MarkerId("12"),
          icon: trafficicon,
          position: const LatLng(4.748829643, -74.100181609)));

      markerList.add(Marker(
          markerId: const MarkerId("13"),
          icon: trafficicon,
          position: const LatLng(4.747168259957861, -74.09727181528785)));

      markerList.add(Marker(
          markerId: const MarkerId("14"),
          icon: trafficicon,
          position: const LatLng(4.7458884300475415, -74.09525923717109)));

      markerList.add(Marker(
          markerId: const MarkerId("15"),
          icon: trafficicon,
          position: const LatLng(44.746747450648146, -74.09587980158146)));

       markerList.add(Marker(
        markerId: const MarkerId("16"),
           icon: trafficicon,
          position: const LatLng(4.746879554222184, -74.0958665816572)));

      markerList.add(Marker(
          markerId: const MarkerId("17"),
          icon: trafficicon,
          position: const LatLng(4.7489526490001, -74.094971139)));

      markerList.add(Marker(
          markerId: const MarkerId("18"),
          icon: trafficicon,
          position: const LatLng(4.754094529539928, -74.09202219247895)));

      markerList.add(Marker(
          markerId: const MarkerId("19"),
          icon: trafficicon,
          position: const LatLng(4.745365915, -74.108276011)));
    });
  }

  void navigationProcess() {
    List<mtk.LatLng> myLatLngList = [];
    for (var data in route.routes.first.points) {
      myLatLngList.add(mtk.LatLng(data.latitude, data.longitude));
    }
    mtk.LatLng myPosition =
    mtk.LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
    // we check if our location is on route or not
    int x = mtk.PolygonUtil.locationIndexOnPath(myPosition, myLatLngList, true,
        tolerance: 12);
    /* x: -1 if point does not lie on or near the polyline. 0 if point is between
            poly[0] and poly[1] (inclusive), 1 if between poly[1] and poly[2]... */
    if (x == -1) {
      getNewRouteFromAPI();
    } else {
      myLatLngList[x] = myPosition;
      myLatLngList.removeRange(0, x);
      myRouteList.first.points.clear();
      myRouteList.first.points
          .addAll(myLatLngList.map((e) => LatLng(e.latitude, e.longitude)));
    }
    if (mounted) setState(() {});
  }

  // CHANGE LUISA
  void getNewRouteFromAPI() async {
    if (route.routes.isNotEmpty) route.routes.clear();
    if (myRouteList.isNotEmpty) myRouteList.clear();
    log("GETTING NEW ROUTE !!");

    // Obtener la ubicación actual del usuario
    Position userPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Si la ubicación del usuario es válida, usa esa ubicación como punto de inicio
    LatLng userLatLng = LatLng(userPosition.latitude, userPosition.longitude);

    // Dibujar la nueva ruta desde la ubicación del usuario al destino
    await route.drawRoute([
      userLatLng,  // Usar la ubicación del usuario
      LatLng(_destinationMarker.position.latitude, _destinationMarker.position.longitude)
    ], 'route', Color.fromARGB(255, 33, 155, 255), Constants.googleApiKey,
        travelMode: TravelModes.driving);

    myRouteList.add(route.routes.first);

    if (mounted) setState(() {});
  }

  // void getNewRouteFromAPI() async {
  // if (route.routes.isNotEmpty) route.routes.clear();
  //if (myRouteList.isNotEmpty) myRouteList.clear();
  //log("GETTING NEW ROUTE !!");
  //await route.drawRoute([
  // LatLng(4.729116356867422, -74.04060057469925),
  // LatLng(_destinationMarker.position.latitude,
  // _destinationMarker.position.longitude)
  // ], 'route', Color.fromARGB(255, 33, 155, 255), Constants.googleApiKey,
  // travelMode: TravelModes.driving);
  //myRouteList.add(route.routes.first);
  //if (mounted) setState(() {});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (PermissionProvider.permissionDialogRoute != null &&
          PermissionProvider.permissionDialogRoute!.isActive) {
        Navigator.of(context)
            .removeRoute(PermissionProvider.permissionDialogRoute!);
      }
      Future.delayed(Duration(milliseconds: 250), () async {
        checkPermissionAndListenLocation();
      });
    }
  }

  Future<void> _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString(Constants.darkMapStyleJson);
  }

  void checkPermissionAndListenLocation() {
    PermissionProvider.handleLocationPermission(context).then((_) {
      print(
          "===========>>>>>>>> check permissions isOn: ${PermissionProvider.isServiceOn}: - ${PermissionProvider.locationPermission}: ${PermissionStatus.granted}");
      if (_positionStream == null &&
          // PermissionProvider.isServiceOn &&
          PermissionProvider.locationPermission == PermissionStatus.granted) {
        startListeningLocation();
      }
      if (mounted) setState(() {});
    });
  }

  void startListeningLocation() {
    print("===========>>>>>>>> start listen");
    _positionStream = Geolocator.getPositionStream(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high))
        .listen((Position? position) {
      print("===========>>>>>>>> ${position}");
      if (position != null) {
        log('${position.latitude.toString()}, ${position.longitude.toString()}');
        _controller.future.then((value) {
          final p = CameraPosition(
              target: LatLng(position.latitude, position.longitude), zoom: 15);
          value.animateCamera(CameraUpdate.newCameraPosition(p));
        });
        showMyLocationOnMap(position);
        if (myRouteList.isNotEmpty) {
          navigationProcess();
        }
      }
    });
  }

  void showMyLocationOnMap(Position position) {
    _currentPosition = position;
    markerList.removeWhere((e) => e.markerId == MarkerId("myLocation"));
    myLocationMarker = Marker(
        markerId: MarkerId("myLocation"),
        position:
        LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
        icon: markerIcon,
        rotation: _currentPosition!.heading);

// Validación de notificación por ubicación

    const double targetLatitude0 = 4.745022907591731;
    const double targetLongitude0 = -74.10867711426246;
    const double targetLatitude1 = 4.7488446639699555;
    const double targetLongitude1 = -74.10034916911711;
    const double targetLatitude2 = 4.747485041395888;
    const double targetLongitude2 = -74.09769909156573;
    const double targetLatitude3 = 4.745887272135376;
    const double targetLongitude3= -74.09564995749123;
    const double targetLatitude4 = 4.746371986000664;
    const double targetLongitude4= -74.09575398924099;
    const double targetLatitude5 = 4.7483551707309095;
    const double targetLongitude5= -74.09524066870416;
    const double targetLatitude6 = 4.753691349304659;
    const double targetLongitude6= -74.0924199670188;
    const double tolerance = 0.0001; // Tolerancia de 10 metros


    // Compara la primera ubicación
    if ((_currentPosition!.latitude - targetLatitude0).abs() < tolerance &&
        (_currentPosition!.longitude - targetLongitude0).abs() < tolerance) {
      _showMyDialog(); // Se encuentra cerca de la primera ubicación
    }

// Compara la primera ubicación
    if ((_currentPosition!.latitude - targetLatitude1).abs() < tolerance &&
        (_currentPosition!.longitude - targetLongitude1).abs() < tolerance) {
      _showMyDialog(); // Se encuentra cerca de la primera ubicación
    }

// Compara la segunda ubicación
    if ((_currentPosition!.latitude - targetLatitude2).abs() < tolerance &&
        (_currentPosition!.longitude - targetLongitude2).abs() < tolerance) {
      _showMyDialog();
    }

    // Compara la segunda ubicación
    if ((_currentPosition!.latitude - targetLatitude3).abs() < tolerance &&
        (_currentPosition!.longitude - targetLongitude3).abs() < tolerance) {
      _showMyDialog();
    }

    // Compara la segunda ubicación
    if ((_currentPosition!.latitude - targetLatitude4).abs() < tolerance &&
        (_currentPosition!.longitude - targetLongitude4).abs() < tolerance) {
      _showMyDialog(); // Muestra el diálogo
    }

    // Compara la segunda ubicación
    if ((_currentPosition!.latitude - targetLatitude5).abs() < tolerance &&
        (_currentPosition!.longitude - targetLongitude5).abs() < tolerance) {
      _showMyDialog(); // Muestra el diálogo
    }

    // Compara la segunda ubicación
    if ((_currentPosition!.latitude - targetLatitude6).abs() < tolerance &&
        (_currentPosition!.longitude - targetLongitude6).abs() < tolerance) {
      _showMyDialog(); // Muestra el diálogo
    }

    //// Validación de notificación por ubicación

    if (markerIcon != BitmapDescriptor.defaultMarker) {
      markerList.add(myLocationMarker!);
    }
    if (mounted) setState(() {});

  }
}