import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/task/firebaseCredentials.dart';

class GetData extends StatefulWidget {
  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  final CollectionReference devicesCollection =
      FirebaseFirestore.instance.collection('Categories');
  var totalCartValue = 0;

  int _n = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireStore'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Categories').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Text('Loading Data ...Please Wait ');
          return Container(
            height: 400,
            width: double.infinity,
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(snapshot.data.documents[0]['category1']),
                        Text('$_n', style: new TextStyle(fontSize: 20.0)),
                        IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              size: 30,
                            ),
                            onPressed: () {
                              add();
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(snapshot.data.documents[0]['category2']),
                        Text('$_n', style: new TextStyle(fontSize: 20.0)),
                        IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              size: 30,
                            ),
                            onPressed: () {
                              add2();
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(snapshot.data.documents[0]['category3']),
                        Text('$_n', style: new TextStyle(fontSize: 20.0)),
                        IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              size: 30,
                            ),
                            onPressed: () {
                              add3();
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(snapshot.data.documents[0]['category4']),
                        Text('$_n', style: new TextStyle(fontSize: 20.0)),
                        IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              size: 30,
                            ),
                            onPressed: () {
                              add4();
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(snapshot.data.documents[0]['category5']),
                        Text('$_n', style: new TextStyle(fontSize: 20.0)),
                        IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              size: 30,
                            ),
                            onPressed: () {
                              add5();
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void add() {
    setState(() {
      _n++;
    });
  }

  void add2() {
    setState(() {
      _n++;
    });
  }

  void add3() {
    setState(() {
      _n++;
    });
  }

  void add4() {
    setState(() {
      _n++;
    });
  }



  void add5() {
    setState(() {
      _n++;
    });
  }
}
