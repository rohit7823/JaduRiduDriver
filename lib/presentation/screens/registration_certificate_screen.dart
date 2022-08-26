import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';

class RegistrationCertificationScreen extends StatefulWidget {
  const RegistrationCertificationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationCertificationScreen> createState() =>
      _RegistrationCertificationScreenState();
}

class _RegistrationCertificationScreenState
    extends State<RegistrationCertificationScreen> {
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
