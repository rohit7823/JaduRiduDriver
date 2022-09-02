import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';

class VehiclePollution extends StatefulWidget {
  const VehiclePollution({Key? key}) : super(key: key);

  @override
  State<VehiclePollution> createState() => _VehiclePollutionState();
}

class _VehiclePollutionState extends State<VehiclePollution> {
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
