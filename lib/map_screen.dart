import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GpsTrackerPage extends StatefulWidget {
  const GpsTrackerPage({Key? key}) : super(key: key);

  @override
  GpsTrackerPageState createState() => GpsTrackerPageState();
}

class GpsTrackerPageState extends State<GpsTrackerPage> {
  bool _isSoundOn = false;
  bool _isLightOn = false;
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = LatLng(45.521563, -122.677433);
  final Set<Marker> _markers = {};

  LatLng? lastMapPosition;

  final MapType _currentMapType = MapType.normal;

  static const CameraPosition _position1 = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(45.531563, -122.677433),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  Future<void> goToPosition1() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }

  void _toggleSound() {
    setState(() {
      _isSoundOn = !_isSoundOn;
    });
  }

  void _toggleLight() {
    setState(() {
      _isLightOn = !_isLightOn;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  String _getPetLocation() {
    // TODO: replace with the pet's actual location
    return '123 Main St, Anytown USA';
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/map.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.white,
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: const CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
                    mapType: _currentMapType,
                    markers: _markers,
                    onCameraMove: _onCameraMove,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                _getPetLocation(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Open Sans',
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _toggleSound,
                    child: Text(_isSoundOn ? 'Stop Sound' : 'Start Sound'),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: _toggleLight,
                    child: Text(_isLightOn ? 'Stop Light' : 'Start Light'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
