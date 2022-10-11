import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/core/domain/ride_id.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class RideNavigationScreen extends StatefulWidget {
  RideId rideId;
  RideNavigationScreen({Key? key, required this.rideId}) : super(key: key);

  @override
  State<RideNavigationScreen> createState() => _RideNavigationScreenState();
}

class _RideNavigationScreenState extends State<RideNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widget.rideId.id.text(),
      ),
    );
  }
}
