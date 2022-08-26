import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';

class IdentifyDetailsScreen extends StatefulWidget {
  const IdentifyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<IdentifyDetailsScreen> createState() => _IdentifyDetailsScreenState();
}

class _IdentifyDetailsScreenState extends State<IdentifyDetailsScreen> {
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
