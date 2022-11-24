import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/widgets.dart';

class NewOrder extends StatelessWidget {
  var _curr = ['2022-23', '2023-24', '2024-25'];
  var _currency = '2022-23'.obs;
  var newOrder = false.obs;

  var _entries = ['5', '10', '15', '20'];
  var _entry = '5'.obs;
  var no_of_rows = 1.obs;

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [FormHeading1(text: "New Order: ")],
              ),
              Row(
                children: [
                  Expanded(
                    child: LabelText(text: "Order Id"),
                  ),
                  Expanded(
                    child: InputField(width: 300),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: LabelText(text: "Order Ref No"),
                  ),
                  Expanded(
                    child: InputField(width: 300),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: LabelText(text: "Head of Allocation"),
                  ),
                  Expanded(
                    child: InputField(width: 300),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: LabelText(text: "Order Description"),
                  ),
                  Expanded(
                      child: InputField(
                    width: 400,
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: LabelText(text: "Order Date"),
                  ),
                  Expanded(
                      child: CustomDateField(
                    label: "DD/MM/YYYY",
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: LabelText(text: "Financial Year"),
                  ),
                  Expanded(
                      child: DropdownButton<String>(
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
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: LabelText(text: "Production Unit"),
                  ),
                  Expanded(
                      child: DropdownButton<String>(
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
                ],
              ),
            ],
          ),
          Row(
            children: [
              Button(
                label: "Add Row",
                color: Colors.orangeAccent,
                callback: () {
                  no_of_rows = no_of_rows + 1;
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(() => Container(
                child: Column(
                  children: <Widget>[
                    for (var i = 0; i < no_of_rows.value; i++)
                      Dismissible(
                          onDismissed: (DismissDirection direction) {
                            //onPressedDelete(task);
                            no_of_rows.value = no_of_rows.value - 1;
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('dismissed')));
                          },
                          confirmDismiss: (DismissDirection direction) async {
                            return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Confirm"),
                                  content: const Text(
                                      "Are you sure you wish to delete this item?"),
                                  actions: <Widget>[
                                    Button(
                                      callback: () {
                                        no_of_rows.value = no_of_rows.value - 1;
                                        Get.back();
                                      },
                                      label: "DELETE",
                                      color: Colors.orangeAccent,
                                    ),
                                    Button(
                                      callback: () {
                                        Get.back();
                                      },
                                      label: "CANCEL",
                                      color: Colors.orangeAccent,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          key: UniqueKey(),
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: LabelText(
                                          text: "No of Coach",
                                        )),
                                        const Expanded(
                                            child: InputField(
                                          width: 500,
                                        )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: LabelText(
                                          text: "Train No",
                                        )),
                                        //const SizedBox(width: 10,),
                                        const Expanded(
                                            child: InputField(
                                          width: 300,
                                        )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: LabelText(
                                          text: "Coach Generated:",
                                        )),
                                        Expanded(
                                            child: InputField(
                                          width: 300,
                                        )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: LabelText(
                                          text: "Coach TurnOut",
                                        )),
                                        const Expanded(
                                            child: InputField(
                                          width: 300,
                                        )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: LabelText(
                                          text: "Pink Book No",
                                        )),
                                        const Expanded(
                                            child: InputField(
                                          width: 200,
                                        )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: LabelText(
                                          text: "Requirement Type",
                                        )),
                                        Expanded(
                                            child: DropdownButton<String>(
                                          items: _curr
                                              .map((String dropDownStringItem) {
                                            return DropdownMenuItem<String>(
                                              value: dropDownStringItem,
                                              child: Text(
                                                dropDownStringItem,
                                                style: const TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (newValue) {
                                            _currency.value =
                                                newValue.toString();
                                          },
                                          value: _currency.value,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: LabelText(text: "Zone")),
                                        Expanded(
                                            child: DropdownButton<String>(
                                          items: _curr
                                              .map((String dropDownStringItem) {
                                            return DropdownMenuItem<String>(
                                              value: dropDownStringItem,
                                              child: Text(
                                                dropDownStringItem,
                                                style: const TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (newValue) {
                                            _currency.value =
                                                newValue.toString();
                                          },
                                          value: _currency.value,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: LabelText(
                                          text: "Coach Type",
                                        )),
                                        Expanded(
                                            child: DropdownButton<String>(
                                          items: _curr
                                              .map((String dropDownStringItem) {
                                            return DropdownMenuItem<String>(
                                              value: dropDownStringItem,
                                              child: Text(
                                                dropDownStringItem,
                                                style: const TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (newValue) {
                                            _currency.value =
                                                newValue.toString();
                                          },
                                          value: _currency.value,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              )))
                  ],
                ),
              ))
        ],
      ),
    )

                // Container(
                //       child:
                //               Container(
                //                   margin: EdgeInsets.symmetric(
                //                       vertical: 20, horizontal: width / 12),
                //                   child: viewMobile(context),
                //                 )),

                )));
  }

  // Widget viewMobile(BuildContext context){
  //   return SingleChildScrollView(
  //     child:

  //   );
  // }
}
