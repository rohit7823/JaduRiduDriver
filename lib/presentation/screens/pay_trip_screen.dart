import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/core/domain/ride_ids.dart';

class PayTripScreen extends StatefulWidget {
  RideIds rideIds;
  PayTripScreen({Key? key, required this.rideIds}) : super(key: key);

  @override
  State<PayTripScreen> createState() => _PayTripScreenState();
}

class _PayTripScreenState extends State<PayTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
