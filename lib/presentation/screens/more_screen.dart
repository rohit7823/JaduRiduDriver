import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class MoreScreen extends StatefulWidget {
  final SharedStore sharedStore;
  const MoreScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StringProvider.more.text(),
    );
  }
}
