import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';

class coachProDetails{
  final String coach_no;
  final String CoachType;
  final String maintenanceDepot;
  final String division;
  final String manufacturedBy;
  final int builtYear;
  final String nominatedWorkshop;
  final String lastPOHSS2SS3Workshop;
  final String POHSS2SS3Date;
  final String returnDate;
  final String ExpectedIOHSS1DueDate;
  final String extendedReturnDate;
  final String iohSs1Date;
  final String iohSs1Location;
  final String trainNo;
  final String startDate;
  final String source;
  final String destination;
  final String totalKm;
  final String kmFromLastPOH;
  final String trainNoFromCmm;
  final String startDateFromCmm;
  final String noOfTripAfterPOH;
  

  const coachProDetails({
        required this.coach_no,
        required this.CoachType,
        required this.maintenanceDepot,
        required this.division,
        required this.manufacturedBy,
        required this.builtYear,
        required this.nominatedWorkshop,
        required this.lastPOHSS2SS3Workshop,
        required this.POHSS2SS3Date,
        required this.returnDate,
        required this.ExpectedIOHSS1DueDate,
        required this.extendedReturnDate,
        required this.iohSs1Date,
        required this.iohSs1Location,
        required this.trainNo,
        required this.startDate,
        required this.source,
        required this.destination,
        required this.totalKm,
        required this.kmFromLastPOH,
        required this.trainNoFromCmm,
        required this.startDateFromCmm,
        required this.noOfTripAfterPOH
  });

  
}
