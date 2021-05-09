import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/task/display.dart';
import 'package:rider_app/task/firebaseCredentials.dart';


class AddCategories extends StatefulWidget {
  @override
  _AddCategoriesState createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {

  String type;

  final category1 = TextEditingController();
  final category2 = TextEditingController();
  final category3 = TextEditingController();
  final category4 = TextEditingController();
  final category5 = TextEditingController();

  bool _status = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              height: MediaQuery.of(context).size.height / 1.04,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                              controller: category1,
                              validator: (input) {
                                if (input.isEmpty)
                                  return 'Required Field';
                                else
                                  return null;
                              },

                              decoration: InputDecoration(
                                labelText: 'please enter',
                                labelStyle: TextStyle(
                                  color: Color(0xff9400D3),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff9400D3),
                                    )),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Container(
                          child: TextFormField(
                              controller: category2,
                              validator: (input) {
                                if (input.isEmpty)
                                  return 'Required Field';
                                else
                                  return null;
                              },

                              decoration: InputDecoration(
                                labelText: 'category2',
                                labelStyle: TextStyle(
                                  color: Color(0xff9400D3),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff9400D3),
                                    )),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextFormField(
                              controller: category3,
                              validator: (input) {
                                if (input.isEmpty)
                                  return 'Required Field';
                                else
                                  return null;
                              },

                              decoration: InputDecoration(
                                labelText: 'Notes',
                                labelStyle: TextStyle(
                                  color: Color(0xff9400D3),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff9400D3),
                                    )),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextFormField(
                              controller: category4,
                              validator: (input) {
                                if (input.isEmpty)
                                  return 'Required Field';
                                else
                                  return null;
                              },

                              decoration: InputDecoration(
                                labelText: 'category4',
                                labelStyle: TextStyle(
                                  color: Color(0xff9400D3),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff9400D3),
                                    )),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextFormField(
                              controller: category5,
                              validator: (input) {
                                if (input.isEmpty)
                                  return 'Required Field';
                                else
                                  return null;
                              },

                              decoration: InputDecoration(
                                labelText: 'category5',
                                labelStyle: TextStyle(
                                  color: Color(0xff9400D3),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff9400D3),
                                    )),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40,),
                  Container(

                    height: 40,
                    width: 200,
                    child: RaisedButton(
                      color: Colors.green,
                      child: Text('Submit',
                        style: TextStyle(color: Colors.white,
                        fontSize: 25),
                      ),

                        onPressed: (){
                          submit();


                    }),
                  )


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void submit() async {

    if (_formKey.currentState.validate()) {
      setState(() {
        _status = true;
      });
      String currentUserId = FirebaseCredentials().auth.currentUser.uid;

      FirebaseCredentials().firestore.collection('Categories').doc().set({
        'category1': category1.text,
        'category2': category2.text,
        'category3': category3.text,
        'category4': category4.text,
        'category5': category5.text,

      });
      setState(() {
        _status = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GetData()));
    }
  }
}
