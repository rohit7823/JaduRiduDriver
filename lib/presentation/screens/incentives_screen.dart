import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class IncentivesScreen extends StatefulWidget {
  final SharedStore sharedStore;
  const IncentivesScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<IncentivesScreen> createState() => _IncentivesScreenState();
}

class _IncentivesScreenState extends State<IncentivesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StringProvider.incentives.text(),
      ),
    );
  }
}
