import 'package:first_app/otherForms/model.dart';
import 'package:flutter/material.dart';

class coachPro extends StatefulWidget {
  @override
  _coachPro createState() => _coachPro();
}

class _coachPro extends State<coachPro> {
  coachProDetails c = new coachProDetails(
    ExpectedIOHSS1DueDate: 'hello',
    iohSs1Date: 'hello',
    division: 'hello',
    CoachType: 'hello',
    builtYear: 0,
    extendedReturnDate: 'hello',
    maintenanceDepot: 'hello',
    destination: 'hello',
    nominatedWorkshop: 'hello',
    iohSs1Location: 'hello',
    coach_no: 'hello',
    kmFromLastPOH: 'hello',
    lastPOHSS2SS3Workshop: 'hello',
    manufacturedBy: 'hello',
    noOfTripAfterPOH: 'hello',
    POHSS2SS3Date: 'hello',
    returnDate: 'hello',
    source: 'hello',
    startDate: 'hello',
    startDateFromCmm: 'hello',
    totalKm: 'hello',
    trainNo: 'hello',
    trainNoFromCmm: 'hello',
  );

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return 
    // Scaffold(
    //   body: 
      DefaultTextStyle.merge(
        style: TextStyle(color: Colors.white),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color(0xFF0D47A1),
                Color(0xFF8A2387),
              ])),
          child: ListView(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Coach Number:"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.coach_no),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Coach Type:"), //Maintenance Depot:
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.CoachType),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Maintenance Depot:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.maintenanceDepot),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Division:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.division),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Manufactured By:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.manufacturedBy),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Built year:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text((c.builtYear).toString()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Nominated Workshop:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.nominatedWorkshop),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Last POH/SS2/SS3 Workshop:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.lastPOHSS2SS3Workshop),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("POH/SS2/SS3 Date:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.POHSS2SS3Date),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Return Date:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.returnDate),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Expected IOH/SS1 Due Date:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.ExpectedIOHSS1DueDate),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Extended Return Date:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.extendedReturnDate),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("IOH/SS1 Date:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.iohSs1Date),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("IOH/SS1 Location:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.iohSs1Location),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // ########### end ############

              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Coach Latest status From ICMS",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),

              // Row(
              //   children: [
              //     Text("Coach Latest status From ICMS"),
              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Train Number:"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.trainNo),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Start Date:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.startDate),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Source:"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.source),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Destination:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.destination),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Total Km:"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.totalKm),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Km from Last POH:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.kmFromLastPOH),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //Last box

              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Coach Latest status From CMM",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Train No:"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.trainNoFromCmm),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Start Date:"),
                        ),

                        // new Text("Coach Number:",

                        // ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.startDateFromCmm),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                              "No. of Trip after POH(Include PM & RBPC Trains):"),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(c.noOfTripAfterPOH),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //end
            ],
          ),
        ),
      );
    //);
  }
}
