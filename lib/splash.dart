import 'package:cryptoapp/more.dart';
import 'package:flutter/material.dart';
import 'package:awesome_loader/awesome_loader.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(black),
      body: Column(
        children: <Widget>[
          Text(
            'Loading Crypto',
          ),
          AwesomeLoader(
            loaderType: 2,
          )
        ],
      ),
    );
  }
}