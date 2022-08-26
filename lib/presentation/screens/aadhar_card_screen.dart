import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';

class AadharCardScreen extends StatefulWidget {
  const AadharCardScreen({Key? key}) : super(key: key);

  @override
  State<AadharCardScreen> createState() => _AadharCardScreenState();
}

class _AadharCardScreenState extends State<AadharCardScreen> {
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
