import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class DubbuckPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<DubbuckPage> {
  GoogleMapController? _controller;
  List<LatLng> tappedPoints = [];
  Set<Marker> _markers = Set();
  Set<Polyline> _polylines = Set();
  LatLng? _currentPosition;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _controller?.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _onTap(LatLng position) {
    setState(() {
      // 포인트 추가
      tappedPoints.add(position);
      // 마커 추가
      _markers.add(Marker(
        markerId: MarkerId(tappedPoints.length.toString()),
        position: position,
      ));

      // 두 개의 포인트가 있을 때 폴리라인 그리기
      if (tappedPoints.length == 2) {
        _polylines.add(Polyline(
          polylineId: PolylineId('line1'),
          visible: true,
          points: tappedPoints,
          color: Colors.blue,
          width: 5,
        ));
      }
    });
  }

  void _onMyLocationButtonPressed() {
    if (_currentPosition != null) {
      _controller?.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _currentPosition ?? LatLng(37.77493, -122.41942), // 예비 위치
          zoom: 14.0,
        ),
        onTap: _onTap,
        markers: _markers,
        polylines: _polylines,
        myLocationEnabled: true,
        myLocationButtonEnabled: false, // 기본 버튼 비활성화
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onMyLocationButtonPressed,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.my_location, size: 36.0),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: DubbuckPage()));
