import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class VisiteNos extends StatefulWidget {
  @override
  _VisiteNosState createState() => _VisiteNosState();
}

class _VisiteNosState extends State<VisiteNos> {
  Set<Marker> _marcadores = {};

  _carregarMarcadores() async {
    Set<Marker> _listaMarcadores = {};
    Marker marcador1 = Marker(
        markerId: MarkerId("marker-coffe-house-doceria"),
        position: LatLng(-9.913374338521564, -63.03767822757207),
        infoWindow: InfoWindow(
            title: "Coffee House Doceria"
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet ,
        ),
        onTap: () {
          print("Você clicou em Coffee House Doceria");
        }
    );

    _listaMarcadores.add(marcador1);

    setState(() {
      _marcadores = _listaMarcadores;
    });
  }


  @override
  Widget build(BuildContext context) {
    _carregarMarcadores();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pinkAccent ,
        title: Text(
          'Visite-nos',
          style: TextStyle(
              color: Colors.grey.shade800 ,
              fontSize: 30
          ),
        ),
        ),
    body: Container(
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          zoom: 16,
          target: LatLng(-9.913374338521564, -63.03767822757207),
        ),
        markers: _marcadores,

      ),


    ),
    );
  }
}


