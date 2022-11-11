import 'dart:ui';

import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:first_app/widgets/Responsive.dart';
import 'package:first_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Coach_pro_details.dart';

class CoachSickDetails extends StatelessWidget {

  var isExpanded = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          expand(context),
          const SizedBox(
            height: 20,
          ),

          Padding(padding: EdgeInsets.all(10.0),

          child: FormHeading1(text: "Coach Sick Details:"),
          ),
          
          const SizedBox(
            height: 20,
          ),

          if (Responsive.isDesktop(context)) ...[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
              child: desktopViewCoachSickDetails(),
            )
          ] else ...[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
              child: ViewMobileCoachSickDetails(),
            )
          ],
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormHeading1(text: "Main Defect Details"),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.orange.withAlpha(500), blurRadius: 5.0),
                  // ]
                  ),
              child: (Responsive.isDesktop(context))
                  ? mainDefectDetails2()
                  : mainDefectDetails()),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(label: "+ADD DEFECT", color: Colors.teal),
              const SizedBox(
                width: 20,
              ),
              Button(label: "+ADD MATERIAL", color: Colors.teal),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),

          Padding(padding: EdgeInsets.all(10.0),

          child: FormHeading1(text: "Coach Sick Release Details:"),
          ),
          
          const SizedBox(
            height: 20,
          ),

          if (Responsive.isDesktop(context)) ...[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
              child: desktopViewCoachSickReleaseDetails(),
            )
          ] else ...[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
              child: mobileViewCoachSickReleaseDetails(),
            )
          ],
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Button(label: "SAVE", color: Colors.teal),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  

  Widget expand(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    return Container(
        child: (Width < 500)
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: expansion(),
              )
            : Container(
                margin:
                    EdgeInsets.symmetric(vertical: 0, horizontal: Width / 8),
                child: expansion(),
              ));
  }

  Widget expansion() {
    return Container(
      color: Colors.orange[100],
      child: ExpansionTile(
        backgroundColor:
            isExpanded.value ? Colors.orangeAccent[100] : Colors.blue[100],
        //backgroundColor: Colors.orange[100],
        textColor: isExpanded.value ? Colors.black87 : Colors.black87,
        title: const Text(
          "Coach Sick Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        children: <Widget>[
          SizedBox(width: 500, height: 1000, child: coachPro())
        ],

        onExpansionChanged: (bool value) {
          isExpanded.value = !isExpanded.value;
        },
      ),
    );
  }

  Widget mainDefectDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                    elevation: 100,
                    shadowColor: Colors.grey[400],
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          FormHeading2(text: "LHB BOGIE WITH AIR SPRING"),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Position",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Serial No",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "PI No",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Manufacturer Date",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Commission Date",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Warranty Upto",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "PO No",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "PO Date",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Date of Supply",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                    elevation: 50,
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          FormHeading2(text: "AIR SPRING SECONDARY SUSPENSION"),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Position",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "4",
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Serial No",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "PI No",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Manufacturer Date",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Commission Date",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Warranty Upto",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "PO No",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "PO Date",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Date of Supply",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                    elevation: 50,
                    shadowColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          FormHeading2(text: "AIR RUBBER R_BALLOW"),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Position",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "1",
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Serial No",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "PI No",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Manufacturer Date",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Commission Date",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Warranty Upto",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "PO No",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "PO Date",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: LabelText(
                                    text: "Date of Supply",
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: InputField(
                                    width: 100,
                                  )),
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mainDefectDetails2() {
    final _verticalScrollController = ScrollController();
    final _horizontalScrollController = ScrollController();
    return Container(
      height: 250,
      // width: 700,
      child: AdaptiveScrollbar(
        //width: 2,
        //sliderHeight: 2,
        underColor: Colors.blueGrey.withOpacity(0.3),
        sliderDefaultColor: Colors.orangeAccent.withOpacity(0.5),
        sliderActiveColor: Colors.orangeAccent,
        controller: _verticalScrollController,
        child: AdaptiveScrollbar(
          //width: 2,
          //sliderHeight: 2,
          //sliderDecoration: BoxDecoration(shape: BoxShape.circle),
          //sliderActiveDecoration: BoxDecoration(shape: BoxShape.circle),
          controller: _horizontalScrollController,
          position: ScrollbarPosition.bottom,
          underColor: Colors.blueGrey.withOpacity(0.3),
          sliderDefaultColor: Colors.orangeAccent.withOpacity(0.5),
          sliderActiveColor: Colors.orangeAccent,
          child: SingleChildScrollView(
            controller: _verticalScrollController,
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              controller: _horizontalScrollController,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(right: 8.0, bottom: 16.0),
                child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Colors.orangeAccent.shade200),
                    showCheckboxColumn: true,
                    columns: [
                      DataColumn(
                          label: FormHeading2(
                        text: "Problem Head/Sub Head",
                      )),
                      DataColumn(
                          label: FormHeading2(
                        text: "Position",
                      )),
                      DataColumn(label: FormHeading2(text: "Serial No.")),
                      DataColumn(
                          label: FormHeading2(
                        text: "PI No.",
                      )),
                      DataColumn(label: FormHeading2(text: "Manufacturer")),
                      DataColumn(
                          label: FormHeading2(text: "Manufacturer Date")),
                      DataColumn(label: FormHeading2(text: "Commission Date")),
                      DataColumn(label: FormHeading2(text: "Warranty Upto")),
                      DataColumn(label: FormHeading2(text: "PO No")),
                      DataColumn(label: FormHeading2(text: "PO Date")),
                      DataColumn(label: FormHeading2(text: "Date Of Supply")),
                    ],
                    rows: [
                      // Set the values to the columns
                      DataRow(cells: [
                        DataCell(LabelText(text: "LHB BOGIE WITH AIR SPRING")),
                        DataCell(LabelText(text: "PP/PEV")),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                      ]),

                      DataRow(cells: [
                        DataCell(
                            LabelText(text: "AIR SPRING SECONDARY SUSPENSION")),
                        DataCell(Text("4")),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                      ]),

                      DataRow(cells: [
                        DataCell(LabelText(text: "AIR RUBBER R_BALLOW")),
                        DataCell(Text("1")),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                        DataCell(InputField(
                          width: 100,
                        )),
                      ]),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ViewMobileCoachSickDetails() {
    return
        // ListView(
        //   children: [

        Column(children: [
      Row(
        children: [
          Expanded(
            flex: 3,
            child: LabelText(text: "Train Number"),
          ),
          //Expanded(child: LabelText(text: "Sick Head"),),
        ],
      ),
      const Divider(),
      Row(
        children: [
          Expanded(
            flex: 3,
            child: LabelText(text: "Sick Head"),
          ),
          //Expanded(child: LabelText(text: "Sick Head"),),
        ],
      ),
      const Divider(),
      Row(
        children: [
          Expanded(
            flex: 3,
            child: LabelText(text: "Reported Defect"),
          ),
          //Expanded(child: LabelText(text: "Sick Head"),),
        ],
      ),
      const Divider(),
      Row(
        children: [
          Expanded(
            flex: 3,
            child: LabelText(text: "Sick Date & Time"),
          ),
          //Expanded(child: LabelText(text: "Sick Head"),),
        ],
      ),
      const Divider(),
      Row(
        children: [
          Expanded(
            flex: 3,
            child: LabelText(text: "Sick Location"),
          ),
          //Expanded(child: LabelText(text: "Sick Head"),),
        ],
      ),
      const Divider(),
      Row(
        children: [
          Expanded(
            flex: 3,
            child: LabelText(text: "Cause of Sick"),
          ),
          //Expanded(child: LabelText(text: "Sick Head"),),
        ],
      ),
      const Divider(),
      Row(
        children: [
          Expanded(
            flex: 3,
            child: LabelText(text: "Observatin/Reason"),
          ),
          //Expanded(child: LabelText(text: "Sick Head"),),
        ],
      ),
      const Divider(),
      Row(
        children: [
          Expanded(
            flex: 3,
            child: LabelText(text: "Work Done"),
          ),
          //Expanded(child: LabelText(text: "Sick Head"),),
        ],
      ),
    ]);
    //     ],
    // );
  }

  Widget desktopViewCoachSickDetails() {
    return
        // ListView(
        // children: [

        //   Padding(
        //     padding: EdgeInsets.all(10.0),
        //     child:
        Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        
        Column(children: [
          Row(
            children: [
              Expanded(flex: 3, child: LabelText(text: "Train Number")),
              Expanded(flex: 2, child: LabelText(text: "Sick Location")),
            ],
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
        Column(children: [
          Row(
            children: [
              Expanded(flex: 3, child: LabelText(text: "Sick Head")),
              Expanded(flex: 2, child: LabelText(text: "Cause of Sick")),
            ],
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
        Column(children: [
          Row(
            children: [
              Expanded(flex: 3, child: LabelText(text: "Reported Defect")),
              Expanded(flex: 2, child: LabelText(text: "Observation/Reason")),
            ],
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
        Column(children: [
          Row(
            children: [
              Expanded(flex: 3, child: LabelText(text: "Sick Date & Time")),
              Expanded(flex: 2, child: LabelText(text: "Work Done")),
            ],
          ),
        ]),
      ],
    );
    //       ),
    //     ],
    // );
  }

  Widget mobileViewCoachSickReleaseDetails() {
    return
        //ListView(
        // children: [
        //   Padding(
        //     padding: EdgeInsets.all(10.0),
        //     child:
        Column(
      children: [
        Row(
          children: [
            Expanded(flex: 3, child: LabelText(text: "Action Taken By")),
            Expanded(
                flex: 2,
                child: InputField(
                  placeholder: "Action Taken By",
                )),
          ],
        ),
        Row(
          children: [
            Expanded(flex: 3, child: LabelText(text: "Failure On Account")),
            Expanded(flex: 2, child: InputField(placeholder: "Select")),
          ],
        ),
        Row(
          children: [
            Expanded(flex: 3, child: LabelText(text: "Remarks")),
            Expanded(flex: 2, child: InputField(placeholder: "Remark")),
          ],
        ),
        Row(
          children: [
            Expanded(flex: 3, child: LabelText(text: "Placement Date & Time")),
            Expanded(flex: 2, child: DateTimeFields(label: "DD/MM/YYYY HH:MM")),
          ],
        ),
        Row(
          children: [
            Expanded(flex: 3, child: LabelText(text: "Fit Date & Time")),
            Expanded(flex: 2, child: DateTimeFields(label: "Fit Date & Time")),
          ],
        ),
      ],
    );
    //       )
    //     ],
    // );
  }

  Widget desktopViewCoachSickReleaseDetails() {
    return
        // ListView(
        //   children: [

        //     Padding(
        //       padding: const EdgeInsets.all(10.0),
        //       child:
        Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // FormHeading1(text: "Coach Sick Release Details:"),
        // const SizedBox(
        //   height: 10,
        // ),
        Row(
          children: [
            Expanded(flex: 2, child: LabelText(text: "Action Taken By")),
            Expanded(flex: 2, child: LabelText(text: "Failure on account")),
            Expanded(
                flex: 2,
                child: LabelText(
                  text: "Remarks",
                )),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: InputField(
                  placeholder: "Action Taken By",
                  width: 100,
                )),
            Expanded(
                flex: 2,
                child: InputField(
                  placeholder: "Failure on account",
                  width: 100,
                )),
            Expanded(
                flex: 2,
                child: InputField(
                  placeholder: "Remark",
                  width: 200,
                )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: LabelText(
                  text: "Placement Date & Time",
                )),
            Expanded(
                flex: 2,
                child: LabelText(
                  text: "Fit Date & Tme",
                )),
            Expanded(flex: 2, child: Container()),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        // Row(
        //   children: [
        //     Expanded(
        //         flex: 2,
        //         child: LabelText(
        //           text: "Placement Date & Time",
        //         )),
        //     Expanded(
        //         flex: 2,
        //         child: LabelText(
        //           text: "Fit Date & Tme",
        //         )),
        //   ],
        // ),

        Row(
          children: [
            Expanded(
                flex: 2,
                child: DateTimeFields(
                  label: "DD/MM/YYYY HH:MM",
                )),
            Expanded(
                flex: 2,
                child: DateTimeFields(
                  label: "Fit Date & Tme",
                )),
            Expanded(flex: 2, child: Container()),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
    //     )
    //   ],
    // );
  }
}


