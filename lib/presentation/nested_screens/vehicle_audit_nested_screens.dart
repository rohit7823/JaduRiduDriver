import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/audit_step.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_audit_step.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/audit_general_screen.dart';
import 'package:mobx/mobx.dart';

extension VehicleAuditNestedScreens on Store {
  Widget provideUI() {
    return AuditGeneralScreen(storeInstance: this);
  }
}
