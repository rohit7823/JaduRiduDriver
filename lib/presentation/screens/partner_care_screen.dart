import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class PartnerCareScreen extends StatefulWidget {
  final SharedStore sharedStore;
  const PartnerCareScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<PartnerCareScreen> createState() => _PartnerCareScreenState();
}

class _PartnerCareScreenState extends State<PartnerCareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StringProvider.partnerCare.text(),
      ),
    );
  }
}
