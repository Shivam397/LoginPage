// // ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'dart:math';

import 'package:first_app/otherForms/excel_view_mobile.dart';
import 'package:first_app/otherForms/coach_sick_details.dart';
import 'package:first_app/otherForms/rake_consist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'otherForms/fetch_rake.dart';
import 'otherForms/mobile_view_table.dart';
import 'otherForms/rake_maintenance.dart';
import 'otherForms/place_order.dart';
import 'otherForms/sfGrid.dart';
import 'widgets/login_screen.dart';
import 'package:get/get.dart';
import './widgets/splash_screen.dart'; 

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: form(),
  ));
}



