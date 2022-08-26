import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';

class VehicleInsuranceScreen extends StatefulWidget {
  const VehicleInsuranceScreen({Key? key}) : super(key: key);

  @override
  State<VehicleInsuranceScreen> createState() => _VehicleInsuranceScreenState();
}

class _VehicleInsuranceScreenState extends State<VehicleInsuranceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
