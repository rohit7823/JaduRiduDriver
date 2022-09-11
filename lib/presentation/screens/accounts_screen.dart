import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../stores/shared_store.dart';

class AccountsScreen extends StatefulWidget {
  final SharedStore sharedStore;
  const AccountsScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StringProvider.accounts.text(),
      ),
    );
  }
}
