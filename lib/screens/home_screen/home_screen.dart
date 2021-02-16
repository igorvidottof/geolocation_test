import 'package:flutter/material.dart';
import 'package:geolocation_test/screens/home_screen/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello Geolocation',
        ),
      ),
      body: SafeArea(
        child: HomeScreenBody(),
      ),
    );
  }
}
