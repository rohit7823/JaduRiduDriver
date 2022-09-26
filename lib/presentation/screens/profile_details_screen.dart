import 'package:flutter/cupertino.dart';
import 'package:jadu_ride_driver/core/common/app_route.dart';

import '../../core/common/profile_short_description.dart';

class ProfileDetailsScreen extends StatefulWidget {
  ProfileDetailsScreen({Key? key, required this.profileShortDescription}) : super(key: key);
  ProfileShortDescription profileShortDescription;


  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {

 // String name =

  @override
  void initState() {
    debugPrint(widget.profileShortDescription.driverName);
    debugPrint(widget.profileShortDescription.driverName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
