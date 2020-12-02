import 'package:flutter/material.dart';

import 'package:jobid/screens/auth/login/components/login_form.dart';
import 'package:jobid/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                  child: Column(children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Text('Daftar Baru',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(22),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                  "Silahkan Daftar Disini",
                  textAlign: TextAlign.center,
                ),
                Container(
                    padding:
                        EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              // hintText: 'EMAIL',
                              // hintStyle: ,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Nama ',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                          obscureText: true,
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Password ',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                        SizedBox(height: 10.0),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Mengulangi Password ',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue))),
                        ),
                        SizedBox(height: 50.0),
                        Container(
                            height: 50.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.blueAccent,
                              child: GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    'Daftar',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: 20.0),
                        Container(
                          height: 50.0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Center(
                                child: Text('Kembali',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ])),
            )));
  }
}
