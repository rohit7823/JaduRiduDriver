import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class ScheduleScreen extends StatefulWidget {
  final SharedStore sharedStore;
  const ScheduleScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StringProvider.schedule.text(),
    );
  }
}
