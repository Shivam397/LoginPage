import 'dart:io';

import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:first_app/otherForms/csv_view_both.dart';
import 'package:first_app/otherForms/excel_view_mobile.dart';
import 'package:first_app/otherForms/excel_view_web.dart';
import 'package:first_app/otherForms/modify_order.dart';
import 'package:first_app/otherForms/new_order.dart';
import 'package:first_app/otherForms/pdf_view_both.dart';
// import 'package:data_table_2/paginated_data_table_2.dart';
import 'package:first_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid_export/export.dart';
import '../otherForms/orderModel.dart';





var _rowsPerPage = 0.obs;
RxString _selectedRow = '-1'.obs;
RxString _selectedCard = '-1'.obs;
var no_of_rows = 1.obs;
var ind = 0.obs;
var i = 0;

class form extends StatelessWidget {
  var _curr = ['2022-23', '2023-24', '2024-25'];
  var _currency = '2022-23'.obs;
  var newOrder = false.obs;

  var _entries = ['5', '10', '15', '20','25','30'];
  var _entry = '5'.obs;

  List<order> orders = <order>[];
  late OrderDataSource orderDataSource;
  double datapagerHeight = 70.0;

  final GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();
  

  var newDataSource = DTS();

  

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // orders = order.getOrders();
    // orderDataSource = OrderDataSource(orderData: orders);

    orders = order.getOrders();
    orderDataSource = OrderDataSource(orderData: orders);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: (width > 1024)
                ? Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 20, horizontal: width / 8),
                    child: view(context))
                : (width > 600 && width <= 1024)
                    ? Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 20, horizontal: width / 14),
                        child: view(context),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 20, horizontal: width / 12),
                        child: placeOrderforMobile(context),
                      )),
      ),
    );
  }

  Widget view(BuildContext context) {
    var dts = DTS();

    
    double width = MediaQuery.of(context).size.width;
    final _verticalScrollController2 = ScrollController();
    final _horizontalScrollController2 = ScrollController();
    //print((context).width);

    List<DataRow> buildListOfDataRows(BuildContext context) {
      List<DataRow> dataRows = [];

      for (int i = 0; i < no_of_rows.value; i++) {
        DataRow row = DataRow(
          //color: isOdd(i) ? Colors.transparent: Colors.grey,
          cells: [
            DataCell(DropdownButton<String>(
              items: _curr.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: const TextStyle(fontSize: 14.0, color: Colors.black),
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
            DataCell(DropdownButton<String>(
              items: _curr.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: const TextStyle(fontSize: 14.0, color: Colors.black),
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
            DataCell(InputField(
              placeholder: "No Of Coach",
            )),
            DataCell(DropdownButton<String>(
              items: _curr.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: const TextStyle(fontSize: 14.0, color: Colors.black),
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
            DataCell(InputField(
              placeholder: "Train No",
            )),
            DataCell(InputField(
              placeholder: "Pink Book No",
            )),
          ],
        );

        dataRows.add(row);
      }

      return dataRows;
    }

    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            LabelText(text: "Financial Year"),
            const SizedBox(
              width: 40,
            ),

            Obx(() => DropdownButton<String>(
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
            //),
            const SizedBox(
              width: 40,
            ),

            Button(
              label: "Get List",
              color: Colors.orangeAccent,
              width: 100,
            ),

            new Spacer(),

            Button(
              label: "+ Place Order",
              color: Colors.orangeAccent,
              callback: () {
                newOrder.value = !newOrder.value;
              },
            ),

            //)
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            LabelText(text: "Show Entries"),
            const SizedBox(
              width: 20,
            ),
            Obx(() => DropdownButton<String>(
                  items: _entries.map((String dropDownStringItem) {
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
                    _entry.value = newValue.toString();
                  },
                  value: _entry.value,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )),
            IconButtonWidget(
              icon: Icons.content_copy,
              size: 18,
              backgroundColor: Colors.orangeAccent.shade200,
            ),
            const SizedBox(
              width: 10,
            ),
            IconButtonWidget(
              icon: FontAwesomeIcons.fileCsv,
              size: 18,
              backgroundColor: Colors.orangeAccent.shade200,
              callback: (){
                createCSVForWeb(_rowsPerPage.value,int.parse(_entry.value));
              },
            ),
            const SizedBox(
              width: 10,
            ),
            IconButtonWidget(
              icon: FontAwesomeIcons.fileExcel,
              size: 18,
              backgroundColor: Colors.orangeAccent.shade200,
              callback: (){
                createExcelForWeb(_rowsPerPage.value,int.parse(_entry.value));
              },
            ),
            const SizedBox(
              width: 10,
            ),
            IconButtonWidget(
              icon: FontAwesomeIcons.print,
              size: 18,
              backgroundColor: Colors.orangeAccent.shade200,
              callback: (){
                Get.to(createPDF(),arguments: [_rowsPerPage.value, int.parse(_entry.value)]);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LabelText(text: "Search:"),
            InputField(
              width: 200,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        Obx(() => PaginatedDataTable(
          //key: UniqueKey(),
              showCheckboxColumn: false,
              onPageChanged: (value) {
                print(_rowsPerPage);
                _rowsPerPage.value = value;
                print(_rowsPerPage);
              },
              rowsPerPage: (order.getOrders().length - _rowsPerPage.value <=
                      int.parse(_entry.value))
                  ? order.getOrders().length - _rowsPerPage.value
                  : int.parse(_entry.value),

              columnSpacing: ((context).width > 1024)
                  ? 56
                  : (context).width > 600 && (context).width <= 1024
                      ? 20
                      : 20,
              source: DTS(),
              //dataRowHeight: ,
              columns: <DataColumn>[
                DataColumn(
                    label: FormHeading2(
                  text: "Order ID",
                )),
                DataColumn(label: FormHeading2(text: "Order Ref Num")),
                DataColumn(label: Expanded(child:FormHeading2(text: "Head of Allocation"))),
                DataColumn(label: FormHeading2(text: "Manufacturer/PU")),
                DataColumn(label: FormHeading2(text: "Order Date")),
                DataColumn(label: FormHeading2(text: "Order Description")),
              ],
            )),

       

        const SizedBox(
          height: 20,
        ),

        

        const SizedBox(
          height: 30,
        ),

        Obx(() => 
        Container(
            child: (_selectedRow.value != '-1')
                ? Container(child: 
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormHeading2(
                          text: "Order details for Order Id :" +
                              '${order.getOrders()[int.parse(_selectedRow.value)].orderId}'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child:
                                  LabelText(text: "Order Reference Number:")),
                          Expanded(child: TextContent(text: '${order.getOrders()[int.parse(_selectedRow.value)].orderRefNum}')),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: LabelText(text: "Head of Allocation:")),
                          Expanded(child: TextContent(text: '${order.getOrders()[int.parse(_selectedRow.value)].headOfAllocation}')),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: LabelText(text: "Financial Year")),
                          Expanded(
                            flex: 1,
                            child: Obx(() => DropdownButton<String>(
                                  items: _curr.map((String dropDownStringItem) {
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
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Expanded(
                            child: LabelText(text: "Production Unit"),
                          ),
                          Expanded(
                              child: Obx(() => DropdownButton<String>(
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
                                  ))),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 1, child: LabelText(text: "Order Date")),
                          Expanded(
                              flex: 1,
                              child: CustomDateField(label: "DD/MM/YYYY")),
                          const SizedBox(
                            width: 40,
                          ),
                          Expanded(
                              flex: 1,
                              child: LabelText(text: "Order Description")),
                          Expanded(flex: 3, child:TextContent(text: '${order.getOrders()[int.parse(_selectedRow.value)].orderDescription}')),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Button(
                      //       label: "Add Row",
                      //       color: Colors.orangeAccent,
                      //       callback: () {
                      //         no_of_rows.value = no_of_rows.value + 1;
                      //         print(no_of_rows.value);
                      //       },
                      //     )
                      //   ],
                      // ),
                    ],
                  ))
                : Container()),
                ),

        Obx(() => Container(
              child: (newOrder == true)
                  ? Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormHeading1(text: "New Order: "),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: LabelText(
                                      text: "Order Reference Number:")),
                              Expanded(child: InputField()),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child:
                                      LabelText(text: "Head of Allocation:")),
                              Expanded(child: InputField()),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: LabelText(text: "Financial Year")),
                              Expanded(
                                flex: 1,
                                child: Obx(() => DropdownButton<String>(
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
                                        _currency.value = newValue.toString();
                                      },
                                      value: _currency.value,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Expanded(
                                child: LabelText(text: "Production Unit"),
                              ),
                              Expanded(
                                  child: Obx(() => DropdownButton<String>(
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
                                          _currency.value = newValue.toString();
                                        },
                                        value: _currency.value,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ))),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: LabelText(text: "Order Date")),
                              Expanded(
                                  flex: 1,
                                  child: CustomDateField(label: "DD/MM/YYYY")),
                              const SizedBox(
                                width: 40,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: LabelText(text: "Order Description")),
                              Expanded(flex: 3, child: InputField()),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Button(
                                label: "Add Row",
                                color: Colors.orangeAccent,
                                callback: () {
                                  no_of_rows.value = no_of_rows.value + 1;
                                  //print(no_of_rows.value);
                                },
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AdaptiveScrollbar(
                              underColor: Colors.blueGrey.withOpacity(0.3),
                              sliderDefaultColor:
                                  Colors.orangeAccent.withOpacity(0.5),
                              sliderActiveColor: Colors.orangeAccent,
                              controller: _verticalScrollController2,
                              child: SingleChildScrollView(
                                  controller: _verticalScrollController2,
                                  scrollDirection: Axis.vertical,
                                  child: SingleChildScrollView(
                                      controller: _horizontalScrollController2,
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Obx(() => DataTable(
                                                columnSpacing: (width > 800 &&
                                                        width < 1200)
                                                    ? 25
                                                    : (width > 1200)
                                                        ? 25
                                                        : 20,
                                                headingRowColor:
                                                    MaterialStateColor
                                                        .resolveWith((states) =>
                                                            Colors.orangeAccent
                                                                .shade200),
                                                columns: [
                                                  DataColumn(
                                                      label: FormHeading2(
                                                    text: "Zone",
                                                  )),
                                                  DataColumn(
                                                      label: FormHeading2(
                                                    text: "Coach Type",
                                                  )),
                                                  DataColumn(
                                                      label: FormHeading2(
                                                    text: "No of Coach",
                                                  )),
                                                  DataColumn(
                                                      label: FormHeading2(
                                                    text: "Requirement Type",
                                                  )),
                                                  DataColumn(
                                                      label: FormHeading2(
                                                    text: "Train No",
                                                  )),
                                                  DataColumn(
                                                      label: FormHeading2(
                                                    text: "Pink Book No",
                                                  )),
                                                  DataColumn(
                                                      label: FormHeading2(
                                                    text: "Coach Generated",
                                                  )),
                                                  DataColumn(
                                                      label: FormHeading2(
                                                    text: "Coach TurnOut",
                                                  )),
                                                ],
                                                rows: List.generate(
                                                  no_of_rows.value,
                                                  (index) {
                                                    //var myAttenList = controller.myPackageList[index];
                                                    return DataRow(cells: [
                                                      DataCell(DropdownButton<
                                                          String>(
                                                        items: _curr.map((String
                                                            dropDownStringItem) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value:
                                                                dropDownStringItem,
                                                            child: Text(
                                                              dropDownStringItem,
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      14.0,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          );
                                                        }).toList(),
                                                        onChanged: (newValue) {
                                                          _currency.value =
                                                              newValue
                                                                  .toString();
                                                        },
                                                        value: _currency.value,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      )),
                                                      DataCell(DropdownButton<
                                                          String>(
                                                        items: _curr.map((String
                                                            dropDownStringItem) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value:
                                                                dropDownStringItem,
                                                            child: Text(
                                                              dropDownStringItem,
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      14.0,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          );
                                                        }).toList(),
                                                        onChanged: (newValue) {
                                                          _currency.value =
                                                              newValue
                                                                  .toString();
                                                        },
                                                        value: _currency.value,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      )),
                                                      DataCell(InputField(
                                                        placeholder:
                                                            "No Of Coach",
                                                      )),
                                                      DataCell(DropdownButton<
                                                          String>(
                                                        items: _curr.map((String
                                                            dropDownStringItem) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value:
                                                                dropDownStringItem,
                                                            child: Text(
                                                              dropDownStringItem,
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      14.0,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          );
                                                        }).toList(),
                                                        onChanged: (newValue) {
                                                          _currency.value =
                                                              newValue
                                                                  .toString();
                                                        },
                                                        value: _currency.value,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      )),
                                                      DataCell(InputField(
                                                        placeholder: "Train No",
                                                      )),
                                                      DataCell(InputField(
                                                        placeholder:
                                                            "Pink Book No",
                                                      )),
                                                      DataCell(InputField()),
                                                      DataCell(InputField()),
                                                    ]);
                                                  },
                                                ).toList(),

                                                //buildListOfDataRows(context)
                                              ))))))
                        ],
                      ),
                    )
                  : Container(),
            ))
      ],
    ));
  }

 

  Widget placeOrderforMobile(BuildContext context) {
    // var cardLength = int.parse(_entry.value) > order.getOrders().length
    //     ? order.getOrders().length
    //     : int.parse(_entry.value);

    var rem = order.getOrders().length - int.parse(_entry.value);
    //print(order.getOrders().length);

    var stIndex = 0.obs;
    //var endIndex =  
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Button(
              label: "+Place Order",
              color: Colors.orangeAccent,
              callback: () {
                Get.to(NewOrder());
                //Get.to(ModifyOrder());
              },
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: LabelText(text: "Financial Year:"),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
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
            //new Spacer(),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Button(
                label: "Get List",
                color: Colors.orangeAccent,
                width: 100,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(child: LabelText(text: "Show Entries")),
            Obx(() => DropdownButton<String>(
                  items: _entries.map((String dropDownStringItem) {
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
                    _entry.value = newValue.toString();
                  },
                  value: _entry.value,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            IconButtonWidget(
              icon: Icons.content_copy,
              size: 14,
              backgroundSize: 16,
              backgroundColor: Colors.orangeAccent.shade200,
            ),
            const SizedBox(
              width: 5,
            ),
            IconButtonWidget(
              icon: FontAwesomeIcons.fileCsv,
              size: 14,
              backgroundSize: 16,
              backgroundColor: Colors.orangeAccent.shade200,
              callback: (){
                createCSVForWeb(stIndex.value,int.parse(_entry.value));
              },
            ),
            const SizedBox(
              width: 5,
            ),
            IconButtonWidget(
              icon: FontAwesomeIcons.fileExcel,
              size: 14,
              backgroundSize: 16,
              backgroundColor: Colors.orangeAccent.shade200,
              callback: (){
                //tryExcel(Globalkey: _key);
                createExcel(stIndex.value,int.parse(_entry.value));
              },
            ),
            const SizedBox(
              width: 5,
            ),
            IconButtonWidget(
              icon: FontAwesomeIcons.print,
              size: 14,
              backgroundSize: 16,
              backgroundColor: Colors.orangeAccent.shade200,
              callback: (){
                Get.to(createPDF(),arguments: [stIndex.value, int.parse(_entry.value)]);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),

        // (int.parse(_entry.value) > order.getOrders().length
        //                     ? order.getOrders().length
        //                     : int.parse(_entry.value))


        // (order.getOrders().length - ind.value < (int.parse(_entry.value)) ? ind.value + order.getOrders().length - ind.value : ind.value + int.parse(_entry.value)

        Obx(() => 
        SingleChildScrollView(physics: ScrollPhysics(),child:
        Column(children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: ((order.getOrders().length - stIndex.value < int.parse(_entry.value) ?  order.getOrders().length : stIndex.value + int.parse(_entry.value)) - stIndex.value),
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                      _selectedCard.value = (stIndex.value + index).toString();
                      //print(stIndex.value);
                      //print(index);
                      print(_selectedCard);
                      // //Get.to(NewOrder());
                       Get.to(ModifyOrder(),arguments: "${_selectedCard}");
                      // //Navigator.push(context, MaterialPageRoute(builder: (context)=>ModifyOrder(ord: '${i}')));
                      // //print(ind);
                    },

              child:
                  Card(
                    elevation: 5,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          Row(
                            children: [
                              Expanded(
                                child: LabelText(text: "Order Id"),
                              ),
                              Expanded(
                                  child: TextContent(
                                      text: "${order.getOrders()[stIndex.value + index].orderId}")),
                              Expanded(
                                child: LabelText(text: "Order Ref No"),
                              ),
                              Expanded(
                                  child: TextContent(
                                      text:
                                          "${order.getOrders()[stIndex.value + index].orderRefNum}"))
                            ],
                          ),

                          //const Divider(),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: LabelText(text: "Order Date"),
                              ),
                              Expanded(
                                  child: TextContent(
                                      text:
                                          "${order.getOrders()[stIndex.value + index].orderDate}")),
                              Expanded(
                                child: LabelText(text: "Manufacturer"),
                              ),
                              Expanded(
                                  child: TextContent(
                                text: "${order.getOrders()[stIndex.value + index].Manufacturer}",
                              ))
                            ],
                          ),

                          //const Divider(),
                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: LabelText(text: "Head of Allocation"),
                              ),
                              Expanded(
                                  child: TextContent(
                                      text:
                                          "${order.getOrders()[stIndex.value + index].headOfAllocation}"))
                            ],
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: LabelText(text: "Order Description"),
                              ),
                              Expanded(
                                  child: TextContent(
                                text:
                                    "${order.getOrders()[stIndex.value + index].orderDescription}",
                              )),
                            ],
                          ),
                        ])),
                  )

              
            );
        }),]))),

        

        const SizedBox(
          height: 20,
        ),

        Obx(()=>
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButtonWidget(
                icon: Icons.arrow_back_ios,
                size: 14,
                backgroundColor: (stIndex.value - int.parse(_entry.value) >= 0) ? Colors.orangeAccent : Colors.grey,
                backgroundSize: 16,callback: (){
                  if(stIndex.value - int.parse(_entry.value) >= 0){
                    stIndex.value = stIndex.value - int.parse(_entry.value);
                  }
                },),
            const SizedBox(
              width: 10,
            ),
            IconButtonWidget(
                icon: Icons.arrow_forward_ios,
                size: 14,
                backgroundColor:(stIndex.value + int.parse(_entry.value) < order.getOrders().length) ? Colors.orangeAccent : Colors.grey,
                
                backgroundSize: 16,callback: (){
                  if(stIndex.value + int.parse(_entry.value) < order.getOrders().length){
                    stIndex.value = stIndex.value + int.parse(_entry.value);
                  }
                  
                },),
          ],
        ),),
        const SizedBox(
          height: 20,
        ),

        // Container(
        //   child: (_selectedRow.value != '-1') ? Get.to(ModifyOrder()),
        // )
      ],
    )));
  }
}



class OrderDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  OrderDataSource({required List<order> orderData}) {
    _orderData = orderData;
    _paginatedRows = orderData;
    buildDataGridRow();
  }

  void buildDataGridRow() {
    _orderDataGridRows = _paginatedRows
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<double>(columnName: 'id', value: e.orderId),
              DataGridCell<String>(
                  columnName: 'Order Ref No', value: e.orderRefNum),
              DataGridCell<String>(
                  columnName: 'Head of Allocation', value: e.headOfAllocation),
              DataGridCell<String>(
                  columnName: 'Manufacturer', value: e.Manufacturer),
              DataGridCell<String>(
                  columnName: 'Order Date', value: e.orderDate),
              DataGridCell<String>(
                  columnName: 'Order Description', value: e.orderDescription),
            ]))
        .toList();
  }

  List<DataGridRow> _orderDataGridRows = [];
  List<order> _paginatedRows = [];
  List<order> _orderData = [];

  @override
  List<DataGridRow> get rows => _orderDataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) {
    final int _startIndex = newPageIndex * _rowsPerPage.value;
    int _endIndex = _startIndex + _rowsPerPage.value;
    if (_endIndex > _orderData.length) {
      _endIndex = _orderData.length;
    }

    /// Get particular range from the sorted collection.
    if (_startIndex < _orderData.length && _endIndex <= _orderData.length) {
      _paginatedRows = _orderData.getRange(_startIndex, _endIndex).toList();
    } else {
      _paginatedRows = <order>[];
    }
    buildDataGridRow();
    notifyListeners();
    return Future<bool>.value(true);
  }

  void updateDataGriDataSource() {
    notifyListeners();
  }
}



class DTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
      index: index,
      onSelectChanged: (value) {
        _selectedRow.value = index.toString();
        //print(_selectedRow.value);
      },
      color: MaterialStateColor.resolveWith(
        (states) {
          if (_selectedRow.value == index.toString()) {
            return Colors.grey;
          } else {
            return Colors.white;
          }
        },
      ),
      //_selectedRow.value == index.toString()
      //         ? MaterialStateColor.resolveWith((states) => Colors.grey)
      //         : MaterialStateColor.resolveWith((states) => Colors.transparent),

      cells: [
        DataCell(LabelText(
          text: '${order.getOrders()[index].orderId}',
        )),
        DataCell(LabelText(
          text: '${order.getOrders()[index].orderRefNum}',
        )),
        DataCell(LabelText(
          text: '${order.getOrders()[index].headOfAllocation}',
        )),
        DataCell(LabelText(
          text: '${order.getOrders()[index].Manufacturer}',
        )),
        DataCell(LabelText(
          text: '${order.getOrders()[index].orderDate}',
        )),
        DataCell(Expanded(child: LabelText(
          text: '${order.getOrders()[index].orderDescription}'),
        )),
      ],
    );
  }

  @override
  int get rowCount =>
      order.getOrders().length; // Manipulate this to which ever value you wish

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}




