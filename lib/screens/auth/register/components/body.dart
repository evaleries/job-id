import 'package:flutter/material.dart';

import 'package:jobid/screens/auth/register/components/register_form.dart';
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
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  Text('Daftar Baru',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(22),
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  RegisterForm(),
                ],
              ),
            )),
      ),
    );
  }
}
