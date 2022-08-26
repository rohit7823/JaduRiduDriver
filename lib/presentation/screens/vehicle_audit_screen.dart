import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';

class VehicleAuditScreen extends StatefulWidget {
  const VehicleAuditScreen({Key? key}) : super(key: key);

  @override
  State<VehicleAuditScreen> createState() => _VehicleAuditScreenState();
}

class _VehicleAuditScreenState extends State<VehicleAuditScreen> {
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
