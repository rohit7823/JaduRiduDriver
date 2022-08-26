import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';

class VehiclePermitScreen extends StatefulWidget {
  const VehiclePermitScreen({Key? key}) : super(key: key);

  @override
  State<VehiclePermitScreen> createState() => _VehiclePermitScreenState();
}

class _VehiclePermitScreenState extends State<VehiclePermitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [],
      ),
    );
  }
}
