import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/widgets.dart';
import '../otherForms/orderModel.dart';

class ModifyOrder extends StatelessWidget{
  var _curr = ['2022-23', '2023-24', '2024-25'];
  var _currency = '2022-23'.obs;
  var newOrder = false.obs;

  var _entries = ['5', '10', '15', '20'];
  var _entry = '5'.obs;
  var no_of_rows = 1.obs;
  
  
  @override
  Widget build(BuildContext context) {
    var index = Get.arguments;
    //print(index);
    //print(Get.arguments);
    double width = MediaQuery.of(context).size.width;

    return Scaffold(body:
    SafeArea(child: SingleChildScrollView(
      child:Padding(padding: const EdgeInsets.all(20),child:Column(
        children: [
          FormHeading1(text: "To modify the details: "),
          const SizedBox(height: 20,),
          Column(
          children: [
            Row(children: [
              FormHeading2(
                          text: "Order details for Order Id :" + '${order.getOrders()[int.parse(index)].orderId}'
                              ),
                      const SizedBox(
                        height: 10,
                      ),
            ],),

            const Divider(),
            // Row(
            //   children: [
            //     Expanded(child: LabelText(text: "Order Id"),),
            //     Expanded(child: InputField(width: 300),),
            //   ],  
            // ),

            Row(
              children: [
                Expanded(child: LabelText(text: "Order Ref No"),),
                Expanded(child: TextField(style:const TextStyle(fontSize: 14,color:  Color.fromARGB(255, 104, 103, 103)),
  controller:
      TextEditingController(text: '${order.getOrders()[int.parse(index)].orderRefNum}')), 
),
                
              ],  
            ),
            const Divider(),

            Row(
              children: [
                Expanded(child: LabelText(text: "Head of Allocation"),),
                Expanded(child: TextField(style:const TextStyle(fontSize: 14,color:  Color.fromARGB(255, 104, 103, 103)),
  controller:
      TextEditingController(text: '${order.getOrders()[int.parse(index)].headOfAllocation}')),)
              ],  
            ),

            const Divider(),

            Row(
              children: [
                Expanded(child: LabelText(text: "Order Description"),),
                Expanded(child: TextField(style:const TextStyle(fontSize: 14,color:  Color.fromARGB(255, 104, 103, 103)),
  controller:
      TextEditingController(text: '${order.getOrders()[int.parse(index)].orderDescription}'))
                //TextContent(text: '${order.getOrders()[int.parse(index)].orderDescription}')
                
                ),
              ],  
            ),

            const Divider(),

            Row(
              children: [
                Expanded(child: LabelText(text: "Order Date"),),
                Expanded(child: TextField(style: const TextStyle(fontSize: 14,color:  Color.fromARGB(255, 104, 103, 103)),
  controller:
      TextEditingController(text: '${order.getOrders()[int.parse(index)].orderDate}'))
                //TextContent(text: '${order.getOrders()[int.parse(index)].orderDate}')
                
                ),
              ],  
            ),

            const Divider(),

            Row(
              children: [
                Expanded(child: LabelText(text: "Financial Year"),),
                Expanded(child: DropdownButton<String>(
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

            const Divider(),

            Row(
              children: [
                Expanded(child: LabelText(text: "Production Unit"),),
                Expanded(child: DropdownButton<String>(
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

        const SizedBox(
          height: 30,
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
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: LabelText(
                                    text: "No of Coach",
                                  )),
                                  const Expanded(
                                      child: InputField(
                                    width: 300,
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
                                    items:
                                        _curr.map((String dropDownStringItem) {
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
                                  Expanded(child: LabelText(text: "Zone")),
                                  Expanded(
                                      child: DropdownButton<String>(
                                    items:
                                        _curr.map((String dropDownStringItem) {
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
                                      _currency.value = newValue.toString();
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
                                    items:
                                        _curr.map((String dropDownStringItem) {
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
                        )))
                ],
              ),
            ))
        ],
      ) ,) 
    
    )));
  }

  
}