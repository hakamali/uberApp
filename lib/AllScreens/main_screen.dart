import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider_app/AllWidgets/Divider.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = 'mainScreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;
  GlobalKey<ScaffoldState> scaffoldkey= GlobalKey<ScaffoldState>();
  Position currentPosition;
  var geoLocator= Geolocator();
 double bottomPaddingOfMap=0;
  void locatePosition()async{


    Position position=await Geolocator.getCurrentPosition(

      desiredAccuracy: LocationAccuracy.high
    );
    currentPosition=position;
    LatLng latLngPosition=LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition= CameraPosition(target: latLngPosition,zoom:14 );
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));


  }



  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.533103, 72.697555),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,

      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      drawer: Container(
        color: Colors.white,
        width: 255,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: 165,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/user_icon.png',
                        height: 65,
                        width: 65,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Profile Name',
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'Brand-Bold'),
                          ),
                          SizedBox(
                            height: 0.0,
                          ),
                          Text('Visit Profile '),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              DividerWidget(),
              SizedBox(
                height: 12,
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text(
                  'History',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Visit Profile',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'About',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,

            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;

              setState(() {
                bottomPaddingOfMap=300.0;




              });
              locatePosition();
            },
          ),
          //HamburgerButton for Drawer
          Positioned(
            top: 45,
            left: 22,
            child: GestureDetector(
              onTap: () {
                scaffoldkey.currentState.openDrawer();


              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 6.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7),
                      )
                    ]),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  radius: 20,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 16,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7))
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      'Hi there',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'where to?',
                      style: TextStyle(fontSize: 20, fontFamily: 'Brand-Bold'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 6,
                                spreadRadius: 0.5,
                                offset: Offset(0.7, 0.7))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text('Search Drop Off')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Home'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Your living home address',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12.0),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DividerWidget(),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Add Work'),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Your office address',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12.0),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
