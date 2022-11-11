import 'dart:collection';

import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:first_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/coach.dart';

class RakeConsist extends StatelessWidget {
  var _curr = [
    'Select..',
    'Primary Maintenance',
    'Secondary Maintenance',
    'RBPC'
  ];
  var _currency = 'Select..'.obs;
  double srl = 1;
  final _verticalScrollController = ScrollController();
  final _horizontalScrollController = ScrollController();
  final _verticalScrollController2 = ScrollController();
  final _horizontalScrollController2 = ScrollController();

  RxList<Coach> rakeData = (List<Coach>.of([])).obs;
  RxList<Coach> rakeDataUndo = (List<Coach>.of([])).obs;
  RxList<Coach> coachData = (List<Coach>.of([])).obs;
  var onCoachSelected = [].obs;

  @override
  Widget build(BuildContext context) {
    onPressedDelete(id) {
      srl = 1;
      rakeDataUndo.insert(0, rakeData.removeAt(id));
    }

    onPressedUpward(id) {
      rakeData.insert(id - 1, rakeData.removeAt(id));
      srl = 1;
    }

    onPressedDownward(id) {
      rakeData.insert(id + 1, rakeData.removeAt(id));
      srl = 1;
    }

    final listRake = Coach(
      "NER",
      "NMG",
      "940897",
      0.0,
      0.0,
    );

    final listRake2 = Coach(
      "NER",
      "NCG",
      "940897",
      0.0,
      0.0,
    );

    final listRake3 = Coach(
      "NER",
      "NDFG",
      "000897",
      0.0,
      0.0,
    );

    final listRake4 = Coach(
      "NER",
      "DFG",
      "000897",
      18.0,
      0.0,
    );

    final listRake5 = Coach(
      "NER",
      "NFRFG",
      "000897",
      17.0,
      17.0,
    );

    //final coachData1 = Coach("NCR", "034024", "WGSCN", 19, 10);

    rakeData.add(listRake);
    rakeData.add(listRake2);
    rakeData.add(listRake3);
    rakeData.add(listRake4);
    rakeData.add(listRake5);

    List<DataRow> buildListOfDataRows(BuildContext context) {
      List<DataRow> dataRows = [];

      for (int i = 0; i < rakeData.length; i++) {
        DataRow row = DataRow(
          //color: isOdd(i) ? Colors.transparent: Colors.grey,
          cells: [
            DataCell(
              IconButtonWidget(
                icon: Icons.delete_forever,
                size: 18,
                backgroundColor: Colors.orangeAccent,
                callback: () {
                  double srl = increment();
                  onPressedDelete(i);
                  //print(rakeData[i]);
                },
              ),
            ),
            DataCell(Text('${increment()}')),
            DataCell(Text('${rakeData[i].coachType}')),
            DataCell(Text(
                '${rakeData[i].railway}' + "-" + '${rakeData[i].coachNumber}')),
            DataCell(Text('${rakeData[i].lastTripKm}')),
            DataCell(Text('${rakeData[i].totalKm}')),
            DataCell(
              IconButtonWidget(
                icon: Icons.arrow_upward,
                size: 18,
                backgroundColor: Colors.orangeAccent,
                callback: () {
                  onPressedUpward(i);
                },
              ),
            ),
            DataCell(
              IconButtonWidget(
                icon: Icons.arrow_downward,
                size: 18,
                backgroundColor: Colors.orangeAccent,
                callback: () {
                  onPressedDownward(i);
                },
              ),
            ),
            DataCell(IconButtonWidget(
                icon: Icons.add_circle_outline,
                size: 18,
                backgroundColor: Colors.orangeAccent)),
          ],
        );

        dataRows.add(row);
      }

      return dataRows;
    }

    coachData.add(listRake);
    coachData.add(listRake2);
    coachData.add(listRake3);

    return Scaffold(
        body: SafeArea(
      child: Container(
          // decoration: BoxDecoration(
          //   image: new DecorationImage(
          //     image: new AssetImage("../lib/images/background.png"),
          //     fit: BoxFit.cover,
          //     colorFilter: new ColorFilter.mode(
          //         Colors.black.withOpacity(0.8), BlendMode.dstATop),
          //   ),
          // ),
          child: (Responsive.isDesktop(context))
              ? Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            children: [
                              LabelText(text: "Outward Train No"),
                              const SizedBox(
                                width: 20,
                              ),
                              LabelText(text: "test"),
                              const SizedBox(
                                width: 100,
                              ),
                              LabelText(text: "Start Date"),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 6,
                                child: CustomDateField(
                                  label: "DD/MM/YYYY",
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              LabelText(text: "Maintenance Type"),
                              const SizedBox(
                                width: 20,
                              ),
                              Obx(
                                () => DropdownButton<String>(
                                  items: _curr.map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(
                                        dropDownStringItem,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    _currency.value = newValue.toString();
                                  },
                                  value: _currency.value,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FormHeading2(text: "Rake Consist"),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20),
                            child: Container(
                              height: 450,
                              width: 1200,
                              child: AdaptiveScrollbar(
                                //width: 2,
                                //sliderHeight: 2,
                                underColor: Colors.blueGrey.withOpacity(0.3),
                                sliderDefaultColor:
                                    Colors.orangeAccent.withOpacity(0.5),
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
                                  sliderDefaultColor:
                                      Colors.orangeAccent.withOpacity(0.5),
                                  sliderActiveColor: Colors.orangeAccent,
                                  child: SingleChildScrollView(
                                    controller: _verticalScrollController,
                                    scrollDirection: Axis.vertical,
                                    child: SingleChildScrollView(
                                      controller: _horizontalScrollController,
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: 8.0, bottom: 16.0),
                                        child: DataTable(
                                            headingRowColor:
                                                MaterialStateColor.resolveWith(
                                                    (states) => Colors
                                                        .orangeAccent.shade200),
                                            showCheckboxColumn: false,
                                            columns: _createColumns(context),
                                            rows: buildListOfDataRows(context)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 190),
                          child: Row(
                            children: [
                              Button(label: "Save", color: Colors.teal),
                              const SizedBox(
                                width: 20,
                              ),
                              Button(label: "Create New", color: Colors.teal)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              : mobileRakeConsist(context)),

      //)
    ));
  }

  onPressedUndo(context) {
    if (rakeDataUndo.isEmpty) {
      final snackBar = SnackBar(
        content: LabelText(text: "No Content to Display!"),
        backgroundColor: (Colors.white),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'dismiss',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      rakeData.insert(0, rakeDataUndo.removeLast());
      srl = 1;
    }
  }

  double increment() {
    return srl++;
  }

  onPressedReverse() {
    for (var i = 0; i < rakeData.length / 2; i++) {
      var temp = rakeData[i];
      rakeData[i] = rakeData[rakeData.length - 1 - i];
      rakeData[rakeData.length - 1 - i] = temp;
    }
    srl = 1;
  }

  List<DataColumn> _createColumns(BuildContext context) {
    return [
      DataColumn(
          label: IconButtonWidget(
        icon: Icons.undo,
        backgroundColor: Colors.orangeAccent,
        size: 20,
        callback: () {
          onPressedUndo(context);
        },
      )),
      DataColumn(
          label: FormHeading2(
        text: "Srl",
      )),
      DataColumn(label: FormHeading2(text: "Coach Type")),
      DataColumn(
          label: FormHeading2(
        text: "Coach Number",
      )),
      DataColumn(label: FormHeading2(text: "Last trip Km")),
      DataColumn(label: FormHeading2(text: "Total Km")),
      DataColumn(
          label: IconButtonWidget(
        icon: Icons.loop_rounded,
        backgroundColor: Colors.orangeAccent,
        size: 18,
        callback: () {
          onPressedReverse();
        },
      )),
      const DataColumn(
          label: IconButtonWidget(
        icon: Icons.add_circle_outline,
        backgroundColor: Colors.orangeAccent,
        size: 18,
      )),
      DataColumn(
          label: IconButtonWidget(
              icon: Icons.add_circle_outline,
              backgroundColor: Colors.orangeAccent,
              size: 18,
              callback: () async {
                showModalBottomSheet(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    context: context,
                    constraints: const BoxConstraints(
                      maxWidth: 600,
                    ),
                    builder: (context) => floatingSheet(context));
              })),
    ];
  }

  Widget floatingSheet(BuildContext context) {
    List<DataRow> buildListOfCoaches(BuildContext context) {
      List<DataRow> dataCoaches = [];

      for (int i = 0; i < coachData.length; i++) {
        DataRow row = DataRow(
          onSelectChanged: (value) {
            // if (!onCoachSelected.contains(i)) {
            //   onCoachSelected.add(i);
            //   rakeData.add(coachData[i]);
            // }
            // srl = 1;
          },
          color: onCoachSelected.contains(i)
              ? MaterialStateColor.resolveWith((states) => Colors.grey.shade200)
              : MaterialStateColor.resolveWith((states) => Colors.transparent),
          cells: [
            DataCell(LabelText(
              text: '${coachData[i].railway}',
            )),
            DataCell(
              LabelText(
                text: '${coachData[i].coachType}',
              ),
            ),
            DataCell(
              LabelText(
                text: '${coachData[i].coachNumber}',
              ),
            ),
            DataCell(
              IconButtonWidget(
                icon: Icons.add,
                size: 16,
                backgroundSize: 16,
                iconColor: (onCoachSelected.contains(i))
                    ? Colors.grey
                    : Colors.orangeAccent,
                backgroundColor: (onCoachSelected.contains(i))
                    ? Colors.grey
                    : Colors.orangeAccent,
                callback: () {
                  if (!onCoachSelected.contains(i)) {
                    onCoachSelected.add(i);
                    rakeData.add(coachData[i]);
                  }
                  srl = 1;
                },
              ),
            )
          ],
        );

        dataCoaches.add(row);
      }

      return dataCoaches;
    }

    return Scaffold(
        body:
            //Center(
            //child:
            Card(
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0))),
          child: Column(
            children: [
              FormHeading1(text: "Search Coach"),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 2,
                        child: LabelText(
                          text: "Railway",
                        )),
                    Expanded(
                      flex: 2,
                      child: InputField(
                        width: 60,
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 2,
                        child: LabelText(
                          text: "Coach Number",
                        )),
                    Expanded(
                      flex: 2,
                      child: InputField(
                        width: 60,
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 2,
                        child: LabelText(
                          text: "Coach Type",
                        )),
                    Expanded(
                      flex: 2,
                      child: InputField(
                        width: 60,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () {},
                        )),
                  ],
                ),
              ),

              const SizedBox(
                height: 50,
              ),
              Obx(
                () => AdaptiveScrollbar(
                  //width: 2,
                  //sliderHeight: 2,
                  underColor: Colors.blueGrey.withOpacity(0.3),
                  sliderDefaultColor: Colors.orangeAccent.withOpacity(0.5),
                  sliderActiveColor: Colors.orangeAccent,
                  controller: _verticalScrollController2,
                  child: SingleChildScrollView(
                    controller: _verticalScrollController2,
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      controller: _horizontalScrollController2,
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 8.0, bottom: 16.0),
                        child: DataTable(
                          columnSpacing: 25,
                          headingRowColor: MaterialStateColor.resolveWith(
                              (states) => Colors.orangeAccent.shade200),
                          showCheckboxColumn: false,
                          columns: [
                            DataColumn(label: LabelText(text: "Railway")),
                            DataColumn(label: LabelText(text: "Coach Number")),
                            DataColumn(
                              label: LabelText(text: "Coach Type"),
                            ),
                            DataColumn(
                              label: IconButtonWidget(
                                icon: Icons.add,
                                size: 16,
                                backgroundSize: 16,
                                backgroundColor: Colors.orangeAccent,
                                callback: () {},
                              ),
                            ),
                          ],
                          rows: buildListOfCoaches(context),
                          // coachData.map<DataRow>((e) {
                          //   return DataRow(cells: [
                          //     DataCell(Text('${e.railway}')),
                          //     DataCell(Text('${e.coachNumber}')),
                          //     DataCell(Text('${e.coachType}')),
                          //     DataCell(IconButtonWidget(icon: Icons.add,size: 18,backgroundColor: Colors.orangeAccent,iconColor: Colors.white,callback: (){

                          //     },)),
                          //   ]);
                          // }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //),
              //)
            ],
          ),
        )),
      ),
    )
        //)
        );
  }

  //Widget of mobile view
  Widget mobileRakeConsist(BuildContext context) {
    onPressedDelete(id) {
      srl = 1;
      rakeDataUndo.insert(0, rakeData.removeAt(id));
    }

    return Scaffold(
        body: SingleChildScrollView(
            child: Card(
                child: Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
      child: Column(children: [
        Card(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(flex: 2, child: LabelText(text: "Outward Train No")),
                  Expanded(
                      flex: 3,
                      child: LabelText(
                        text: "Test",
                      )),
                ],
              ),
              Row(
                children: [
                  Expanded(flex: 2, child: LabelText(text: "Start Date")),
                  Expanded(
                      flex: 3,
                      child: CustomDateField(
                        label: "",
                      )),
                ],
              ),
              Row(
                children: [
                  Expanded(flex: 2, child: LabelText(text: "Maintenence Type")),
                  Expanded(
                    flex: 3,
                    child: Obx(() => DropdownButton<String>(
                          items: _curr.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(
                                dropDownStringItem,
                                style: const TextStyle(
                                    fontSize: 14.0, color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            _currency.value = newValue.toString();
                          },
                          value: _currency.value,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FormHeading1(text: "Rake Consist"),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Button(
                label: "Undo",
                color: Colors.teal,
                callback: () {
                  onPressedUndo(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Button(
                label: "Add Coaches",
                color: Colors.teal,
                callback: () async {
                  showModalBottomSheet(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      context: context,
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                      ),
                      builder: (context) => floatingSheet(context));
                },
              ),
            ),
          ],
        ),
        Obx(
          () => _itemBuilder(context),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Button(label: "Save", color: Colors.teal),
              const SizedBox(
                width: 20,
              ),
              Button(label: "Create New", color: Colors.teal)
            ],
          ),
        ),
      ]),
    ))));
  }

  Widget _itemBuilder(BuildContext context) {
    onPressedDelete(id) {
      srl = 1;
      rakeDataUndo.insert(0, rakeData.removeAt(id));
    }

    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ReorderableListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (var task = 0; task < rakeData.length; task++)
                  Dismissible(
                      onDismissed: (DismissDirection direction) {
                        onPressedDelete(task);
                      },
                      key: UniqueKey(),
                      child: Card(
                        color: Colors.orangeAccent.shade100,
                        key: ValueKey(task),
                        elevation: 5.0,
                        child: Card(
                            elevation: 10,
                            child: InkWell(
                              onTap: () {
                                Get.defaultDialog(
                                    title: "Coach Detail",
                                    radius: 10,
                                    textConfirm: "Ok",
                                    confirmTextColor: Colors.white,
                                    buttonColor: Colors.orangeAccent,
                                    onConfirm: () {
                                      Get.back();
                                      //Navigator.of(context).pop();
                                    },
                                    content: expandOnTap(task));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: LabelText(
                                              text: "Coach Type ",
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: LabelText(
                                              text: (rakeData[task].coachType)
                                                  .toString(),
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: LabelText(
                                              text: "Coach Number",
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: LabelText(
                                              text: (rakeData[task].coachNumber)
                                                  .toString(),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      )),
              ],
              onReorder: (oldIndex, newIndex) {
                if (newIndex > oldIndex) {
                  newIndex = newIndex - 1;
                }

                final task = rakeData.removeAt(oldIndex);
                rakeData.insert(newIndex, task);
              })),
    );
  }

  Widget expandOnTap(int task) {
    return Card(
      child: Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: LabelText(
                    text: "Coach Type ",
                  )),
              Expanded(
                  flex: 2,
                  child: LabelText(
                    text: (rakeData[task].coachType).toString(),
                  )),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: LabelText(
                    text: "Coach Number",
                  )),
              Expanded(
                  flex: 2,
                  child: LabelText(
                    text: (rakeData[task].coachNumber).toString(),
                  )),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: LabelText(
                    text: "Last Trip Km",
                  )),
              Expanded(
                  flex: 2,
                  child: LabelText(
                    text: (rakeData[task].lastTripKm).toString(),
                  )),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: LabelText(
                    text: "Total Km",
                  )),
              Expanded(
                  flex: 2,
                  child: LabelText(
                    text: (rakeData[task].totalKm).toString(),
                  )),
            ],
          ),
        ],
      ),
      )
      
    );
  }
}
