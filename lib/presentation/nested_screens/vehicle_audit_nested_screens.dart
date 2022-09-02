import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/audit_step.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_audit_step.dart';

extension VehicleAuditNestedScreens on VehicleAuditStep {
  Widget provideUI() {
    switch (stepKey) {
      case AuditStep.chasisNumberImage:
        return Column(
          children: [],
        );
      case AuditStep.backSideWithNumberPlate:
        return Column(
          children: [],
        );
      case AuditStep.leftSideExterior:
        return Column(
          children: [],
        );
      case AuditStep.rightSideExterior:
        return Column(
          children: [],
        );
      case AuditStep.carInside:
        return Column(
          children: [],
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
