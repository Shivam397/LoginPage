import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:first_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

int _rowsPerPage=5;

class form extends StatelessWidget {
  var _curr = ['2022-23', '2023-24', '2024-25'];
  var _currency = '2022-23'.obs;
  var newOrder = false.obs;

  var _entries = ['5', '10', '15', '20'];
  var _entry = '5'.obs;

  
  List<order> orders = <order>[];
  late OrderDataSource orderDataSource;
  double datapagerHeight = 70.0;

  // List<order> orders = <order>[];
  // late OrderDataSource orderDataSource;

  
  // PaginatedDataGridSource dataGridSource = PaginatedDataGridSource();
  // final List<order> paginatedDataTable=<order>[];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    BoxConstraints constraints;

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
                        vertical: 20, horizontal: width / 6),
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
                        child: placeOrderforMobile(),
                      )),
      ),
    );
  }

  Widget view(BuildContext context) {
    //var dts = DTS();
    BoxConstraints constraints;
    final _verticalScrollController2 = ScrollController();
    final _horizontalScrollController2 = ScrollController();
    //print((context).width);
    return 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //Expanded(flex: 1, child:
            LabelText(text: "Financial year"),
            const SizedBox(
              width: 40,
            ),
            //),
            // Expanded(
            //     flex: 2,
            //     child:
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
            // Expanded(
            //     child:
            Button(
              label: "Get List",
              color: Colors.orangeAccent,
              width: 100,
            ),

            new Spacer(),

            Button(
              label: "+ Place Order",
              color: Colors.orangeAccent,
              //width: 100,
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
              width: 10,
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
            // Button(
            //   label: "COPY",
            //   color: Colors.orangeAccent,
            //   width: 80,
            // ),
            const SizedBox(
              width: 10,
            ),
            IconButtonWidget(
              icon: FontAwesomeIcons.fileCsv,
              size: 18,
              backgroundColor: Colors.orangeAccent.shade200,
            ),
            // Button(
            //   label: "CSV",
            //   color: Colors.orangeAccent,
            //   width: 80,
            // ),
            const SizedBox(
              width: 10,
            ),
            IconButtonWidget(
              icon: FontAwesomeIcons.fileExcel,
              size: 18,
              backgroundColor: Colors.orangeAccent.shade200,
            ),
            // Button(
            //   label: "EXCEL",
            //   color: Colors.orangeAccent,
            //   width: 90,
            // ),
            const SizedBox(
              width: 10,
            ),
            IconButtonWidget(
              icon: FontAwesomeIcons.print,
              size: 18,
              backgroundColor: Colors.orangeAccent.shade200,
            ),
            // Button(
            //   label: "PRINT",
            //   color: Colors.orangeAccent,
            //   width: 90,
            // ),
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


        // Obx(() => PaginatedDataTable(
        //       rowsPerPage: int.parse(_entry.value),
        //       //autoRowsToHeight: true,
        //       columnSpacing: ((context).width > 1024)
        //           ? 56
        //           : (context).width > 600 && (context).width <= 1024
        //               ? 20
        //               : 20,
        //       source: dts,
        //       //dataRowHeight: ,
        //       columns: <DataColumn>[
        //         DataColumn(
        //             label: FormHeading2(
        //           text: "Order ID",
        //         )),
        //         DataColumn(label: FormHeading2(text: "Order Ref Num")),
        //         DataColumn(label: FormHeading2(text: "Head of Allocation")),
        //         DataColumn(label: FormHeading2(text: "Manufacturer/PU")),
        //         DataColumn(label: FormHeading2(text: "Order Date")),
        //         DataColumn(label: FormHeading2(text: "Order Description")),
        //       ],
        //     )),

        //table(),

      //   Flexible(child: 
      //   LayoutBuilder(
      //       builder: (BuildContext context, BoxConstraints constraints) {
      //     return 

        Expanded(child: 
        LayoutBuilder(builder: (context, constraint) {
    return Column(children: [
      SizedBox(
          height: constraint.maxHeight - datapagerHeight,
          width: constraint.maxWidth,
          child: _buildDataGrid(constraint)),
      Container(
          height: datapagerHeight,
          child: SfDataPager(
            delegate: orderDataSource,
            pageCount: orders.length / _rowsPerPage,
            direction: Axis.horizontal,
          ))
    ]);
  })),
        Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - datapagerHeight,
                //height: 800,
                child: Obx(()=>
                SfDataGrid(
                    source: orderDataSource,
                    rowsPerPage: int.parse(_entry.value),
                    columnWidthMode: ColumnWidthMode.fitByColumnName,
                    columns: <GridColumn>[
        
      ]),)
              ),
              Container(
                  height: datapagerHeight,
                  child: Obx(()=>
                  SfDataPager(
                    delegate: orderDataSource,
                    visibleItemsCount: int.parse(_entry.value),
                    availableRowsPerPage: [2,4,5,10,15, 20,25, 30],
                    onRowsPerPageChanged: (int? rowsPerPage) {
                      // setState(() {
                        _rowsPerPage = rowsPerPage!;
                        orderDataSource.updateDataGriDataSource();
                      // });
                    },
                    pageCount:
                        ((orders.length / _rowsPerPage).ceil()).toDouble(),
                  ))),
            ],
          ),
      //       })),
        //}),

     


        const SizedBox(
          height: 30,
        ),
        Container(
          child: (newOrder == false)
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
                              child:
                                  LabelText(text: "Order Reference Number:")),
                          Expanded(child: InputField()),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: LabelText(text: "Head of Allocation:")),
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
                          // const SizedBox(
                          //   width: 30,
                          // ),
                          //),
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
                          Expanded(flex: 3, child: InputField()),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Button(label: "Add Row", color: Colors.orangeAccent)
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AdaptiveScrollbar(
                          //width: 2,
                          //sliderHeight: 2,
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
                                      padding: const EdgeInsets.only(
                                          right: 8.0, bottom: 16.0),
                                      child: DataTable(columnSpacing: 35,
                                          //headingRowColor:
                                          //  MaterialStateColor.resolveWith(
                                          //    (states) => Colors
                                          //      .orangeAccent.shade200),
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
                                          ], rows: [
                                        DataRow(cells: [
                                          DataCell(DropdownButton<String>(
                                            items: _curr.map(
                                                (String dropDownStringItem) {
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
                                          DataCell(DropdownButton<String>(
                                            items: _curr.map(
                                                (String dropDownStringItem) {
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
                                          DataCell(InputField(
                                            placeholder: "No Of Coach",
                                          )),
                                          DataCell(DropdownButton<String>(
                                            items: _curr.map(
                                                (String dropDownStringItem) {
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
                                          DataCell(InputField(
                                            placeholder: "Train Number",
                                          )),
                                          DataCell(InputField(
                                            placeholder: "Pink Book No",
                                          )),
                                        ])
                                      ])))))
                    ],
                  ),
                )
              : Container(),
        )
      ],
    );
  }

  Widget _buildDataGrid(BoxConstraints constraint){
    return SfDataGrid(
      source: orderDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      columns: <GridColumn>[
        GridColumn(
            columnName: 'Order Id',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  'ID',
                ))),
        GridColumn(
            columnName: 'Order Ref No',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text('Order Ref No'))),
        GridColumn(
            columnName: 'Head of Allocation',
            width: 120,
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text('Head of Allocation'))),
        GridColumn(
            columnName: 'Manufacturer',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text('Manufacturer'))),
        GridColumn(
            columnName: 'Order Date',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text('Order Date'))),
        GridColumn(
            columnName: 'Order Description',
            label: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text('Order Description'))),
      ]);
  }

  // Widget table(){
  //   return Scaffold(
  //     body:LayoutBuilder(builder:(context, constraints) {
  //       return Column(
  //           children: [
  //             Container(
  //               height: constraints.maxHeight - datapagerHeight,
  //               //height: 800,
  //               child: Obx(()=>
  //               SfDataGrid(
  //                   source: orderDataSource,
  //                   rowsPerPage: int.parse(_entry.value),
  //                   columnWidthMode: ColumnWidthMode.fitByColumnName,
  //                   columns: <GridColumn>[
  //       GridColumn(
  //           columnName: 'Order Id',
  //           label: Container(
  //               padding: EdgeInsets.all(16.0),
  //               alignment: Alignment.center,
  //               child: Text(
  //                 'ID',
  //               ))),
  //       GridColumn(
  //           columnName: 'Order Ref No',
  //           label: Container(
  //               padding: EdgeInsets.all(16.0),
  //               alignment: Alignment.center,
  //               child: Text('Order Ref No'))),
  //       GridColumn(
  //           columnName: 'Head of Allocation',
  //           width: 120,
  //           label: Container(
  //               padding: EdgeInsets.all(16.0),
  //               alignment: Alignment.centerLeft,
  //               child: Text('Head of Allocation'))),
  //       GridColumn(
  //           columnName: 'Manufacturer',
  //           label: Container(
  //               padding: EdgeInsets.all(16.0),
  //               alignment: Alignment.center,
  //               child: Text('Manufacturer'))),
  //       GridColumn(
  //           columnName: 'Order Date',
  //           label: Container(
  //               padding: EdgeInsets.all(16.0),
  //               alignment: Alignment.center,
  //               child: Text('Order Date'))),
  //       GridColumn(
  //           columnName: 'Order Description',
  //           label: Container(
  //               padding: EdgeInsets.all(16.0),
  //               alignment: Alignment.center,
  //               child: Text('Order Description'))),
  //     ]),)
  //             ),
  //             Container(
  //                 height: datapagerHeight,
  //                 child: Obx(()=>
  //                 SfDataPager(
  //                   delegate: orderDataSource,
  //                   visibleItemsCount: int.parse(_entry.value),
  //                   availableRowsPerPage: [2,4,5,10,15, 20,25, 30],
  //                   onRowsPerPageChanged: (int? rowsPerPage) {
  //                     // setState(() {
  //                       _rowsPerPage = rowsPerPage!;
  //                       orderDataSource.updateDataGriDataSource();
  //                     // });
  //                   },
  //                   pageCount:
  //                       ((orders.length / _rowsPerPage).ceil()).toDouble(),
  //                 ))),
  //           ],
  //         );
  //     }));
    
  // }

  Widget placeOrderforMobile() {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Button(label: "+Place Order", color: Colors.orangeAccent)],
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
            new Spacer(),
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

            new Spacer(),

            IconButtonWidget(
              icon: Icons.content_copy,
              size: 18,
              backgroundColor: Colors.orangeAccent.shade200,
            ),
            // Button(
            //   label: "COPY",
            //   color: Colors.orangeAccent,
            //   width: 80,
            // ),
            const SizedBox(
              width: 10,
            ),
            IconButtonWidget(
              icon: FontAwesomeIcons.fileCsv,
              size: 18,
              backgroundColor: Colors.orangeAccent.shade200,
            ),
            // Button(
            //   label: "CSV",
            //   color: Colors.orangeAccent,
            //   width: 80,
            // ),
            const SizedBox(
              width: 10,
            ),
            IconButtonWidget(
              icon: FontAwesomeIcons.fileExcel,
              size: 18,
              backgroundColor: Colors.orangeAccent.shade200,
            ),
            // Button(
            //   label: "EXCEL",
            //   color: Colors.orangeAccent,
            //   width: 90,
            // ),
            const SizedBox(
              width: 10,
            ),
            IconButtonWidget(
              icon: FontAwesomeIcons.print,
              size: 18,
              backgroundColor: Colors.orangeAccent.shade200,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        for (var i = 0; i < order.getOrders().length; i++)
          // Column(children: [
          //   const SizedBox(
          //     height: 10,
          //   ),

          //     Expanded(
          //   child: ScrollSnapList(
          //     onItemFocus: _onItemFocus,
          //     itemSize: 150,
          //     itemBuilder: ,
          //     itemCount: order.getOrders().length,
          //     dynamicItemSize: true,
          //     // dynamicSizeEquation: customEquation, //optional
          //   ),
          // ),

          Card(
            elevation: 5,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: LabelText(text: "Order Id"),
                      ),
                      Expanded(
                          child: TextContent(
                              text: "${order.getOrders()[i].orderId}"))
                    ],
                  ),

                  //const Divider(),
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: LabelText(text: "Order Ref No"),
                      ),
                      Expanded(
                          child: TextContent(
                              text: "${order.getOrders()[i].orderRefNum}"))
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
                              text: "${order.getOrders()[i].headOfAllocation}"))
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
                              text: "${order.getOrders()[i].orderDate}"))
                    ],
                  ),
                  //const Divider(),
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: LabelText(text: "Manufacturer"),
                      ),
                      Expanded(
                          child: TextContent(
                        text: "${order.getOrders()[i].Manufacturer}",
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
                        child: LabelText(text: "Order Description"),
                      ),
                      Expanded(
                          child: TextContent(
                        text: "${order.getOrders()[i].orderDescription}",
                      )),
                    ],
                  ),
                ])),
          )
      ],
    ))
        //],
        //),

        //)
        );
  }
}

// class OrderDataSource extends DataGridSource {
//   List<DataGridRow>  _orders = [];
//   //List<order> _data = [];

//   @override
//   List<DataGridRow> get rows =>  _orders;

//   OrderDataSource({required List<order> orders}) {
//      _orders = orders.map<DataGridRow>((e) => DataGridRow(cells: [
//               DataGridCell<double>(columnName: 'id', value: e.orderId),
//               DataGridCell<String>(columnName: 'Order Ref No', value: e.orderRefNum),
//               DataGridCell<String>(
//                   columnName: 'Head of Allocation', value: e.headOfAllocation),
//               DataGridCell<String>(columnName: 'Manufacturer', value: e.Manufacturer),
//               DataGridCell<String>(
//                   columnName: 'Order Date', value: e.orderDate),
//               DataGridCell<String>(columnName: 'Order Description', value: e.orderDescription),
//             ]))
//         .toList();
//   }

  

//   @override
//   DataGridRowAdapter? buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((dataGridCell) {
//       return Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(16.0),
//         child: Text(dataGridCell.value.toString()),
//       );
//     }).toList());
//   }
// }

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
              DataGridCell<String>(columnName: 'Order Ref No', value: e.orderRefNum),
              DataGridCell<String>(
                  columnName: 'Head of Allocation', value: e.headOfAllocation),
              DataGridCell<String>(columnName: 'Manufacturer', value: e.Manufacturer),
              DataGridCell<String>(
                  columnName: 'Order Date', value: e.orderDate),
              DataGridCell<String>(columnName: 'Order Description', value: e.orderDescription),
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
    final int _startIndex = newPageIndex * _rowsPerPage;
    int _endIndex = _startIndex + _rowsPerPage;
    if (_endIndex > _orderData.length) {
      _endIndex = _orderData.length;
    }

    /// Get particular range from the sorted collection.
    if (_startIndex < _orderData.length &&
        _endIndex <= _orderData.length) {
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


//class PaginatedDataGridSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  // OrderDataSource({required List<order> orderData}) {
  //   _orderData = orderData
  //       .map<DataGridRow>((e) => DataGridRow(cells: [
  //             DataGridCell<double>(columnName: 'id', value: e.orderId),
  //             DataGridCell<String>(columnName: 'Order Ref No', value: e.orderRefNum),
  //             DataGridCell<String>(
  //                 columnName: 'Head of Allocation', value: e.headOfAllocation),
  //             DataGridCell<String>(columnName: 'Manufacturer', value: e.Manufacturer),
  //             DataGridCell<String>(
  //                 columnName: 'Order Date', value: e.orderDate),
  //             DataGridCell<String>(columnName: 'Order Description', value: e.orderDescription),
  //           ])
  //           )
  //       .toList();
  // }

  // List<DataGridRow> get rows => _paginatedData.map<DataGridRow>((e) => DataGridRow(cells: [
  //   DataGridCell<double>(columnName: 'id', value: e.orderId),
  //             DataGridCell<String>(columnName: 'Order Ref No', value: e.orderRefNum),
  //             DataGridCell<String>(
  //                 columnName: 'Head of Allocation', value: e.headOfAllocation),
  //             DataGridCell<String>(columnName: 'Manufacturer', value: e.Manufacturer),
  //             DataGridCell<String>(
  //                 columnName: 'Order Date', value: e.orderDate),
  //             DataGridCell<String>(columnName: 'Order Description', value: e.orderDescription),
  // ])).toList();

  //List<DataGridRow> _orderData = [];

  // @override
  // List<DataGridRow> get rows => _orderData;

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//       return Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(8.0),
//         child: Text(e.value.toString()),
//       );
//     }).toList());
//   }
// }

// class DTS extends DataTableSource {
//   @override
//   DataRow getRow(int index) {
//     return DataRow.byIndex(
//       index: index,
//       cells: [
//         DataCell(Expanded(
//             child: LabelText(
//           text: '${order.getOrders()[index].orderId}',
//         ))),
//         DataCell(LabelText(
//           text: '${order.getOrders()[index].orderRefNum}',
//         )),
//         DataCell(LabelText(
//           text: '${order.getOrders()[index].headOfAllocation}',
//         )),
//         DataCell(LabelText(
//           text: '${order.getOrders()[index].Manufacturer}',
//         )),
//         DataCell(LabelText(
//           text: '${order.getOrders()[index].orderDate}',
//         )),
//         DataCell(Expanded(
//             child: LabelText(
//           text: '${order.getOrders()[index].orderDescription}',
//         ))),
//       ],
//     );
//   }

//   @override
//   int get rowCount => 6; // Manipulate this to which ever value you wish

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get selectedRowCount => 0;
// }

class order {
  final double orderId;
  final String orderRefNum;
  final String headOfAllocation;
  final String Manufacturer;
  final String orderDate;
  final String orderDescription;
  final double financialYear;
  final String productionUnit;

  order(
      {required this.orderId,
      required this.orderRefNum,
      required this.headOfAllocation,
      required this.Manufacturer,
      required this.orderDate,
      required this.orderDescription,
      required this.financialYear,
      required this.productionUnit});

  static List<order> getOrders() {
    return [
      order(
          orderId: 1000,
          orderRefNum: "RFS2019",
          headOfAllocation: "",
          Manufacturer: "DMW",
          orderDate: "23/5/2022",
          orderDescription:
              "M231-WR SDGFJHNGJGHNSKSDNFKLMSLMDFSLFMD,.MG,FJDVKDFSGVNDFKNSKLFMCSKLDSMASKADMALKJEIOJDEJFSDMCFFLKSEFEJOT",
          financialYear: 2022 - 23,
          productionUnit: ""),
      order(
          orderId: 1000,
          orderRefNum: "RFS2019",
          headOfAllocation: "",
          Manufacturer: "DMW",
          orderDate: "23/5/2022",
          orderDescription: "M231-WR",
          financialYear: 2022 - 23,
          productionUnit: ""),
      order(
          orderId: 1000,
          orderRefNum: "RFS2019",
          headOfAllocation: "",
          Manufacturer: "DMW",
          orderDate: "23/5/2022",
          orderDescription: "M231-WR",
          financialYear: 2022 - 23,
          productionUnit: ""),
      order(
          orderId: 1001,
          orderRefNum: "RFS2019",
          headOfAllocation: "",
          Manufacturer: "DMW",
          orderDate: "23/5/2022",
          orderDescription: "M231-WR",
          financialYear: 2022 - 23,
          productionUnit: ""),
      order(
          orderId: 1002,
          orderRefNum: "RFS2019",
          headOfAllocation: "",
          Manufacturer: "DMW",
          orderDate: "23/5/2022",
          orderDescription: "M231-WR",
          financialYear: 2022 - 23,
          productionUnit: ""),
      order(
          orderId: 1003,
          orderRefNum: "RFS2019",
          headOfAllocation: "",
          Manufacturer: "DMW",
          orderDate: "23/5/2022",
          orderDescription: "M231-WR",
          financialYear: 2022 - 23,
          productionUnit: ""),
      order(
          orderId: 1001,
          orderRefNum: "RFS2019",
          headOfAllocation: "",
          Manufacturer: "DMW",
          orderDate: "23/5/2022",
          orderDescription: "M231-WR",
          financialYear: 2022 - 23,
          productionUnit: ""),
      order(
          orderId: 1002,
          orderRefNum: "RFS2019",
          headOfAllocation: "",
          Manufacturer: "DMW",
          orderDate: "23/5/2022",
          orderDescription: "M231-WR",
          financialYear: 2022 - 23,
          productionUnit: ""),
      order(
          orderId: 1003,
          orderRefNum: "RFS2019",
          headOfAllocation: "",
          Manufacturer: "DMW",
          orderDate: "23/5/2022",
          orderDescription: "M231-WR",
          financialYear: 2022 - 23,
          productionUnit: ""),
      order(
          orderId: 1003,
          orderRefNum: "RFS2019",
          headOfAllocation: "",
          Manufacturer: "DMW",
          orderDate: "23/5/2022",
          orderDescription: "M231-WR",
          financialYear: 2022 - 23,
          productionUnit: ""),
    ];
  }
}

class Train {
  final Widget zone;
  final Widget coachType;
  final Widget noOfCoach;
  final Widget reqType;
  final Widget trainNo;
  final Widget pinkBookNo;

  Train(
      {required this.zone,
      required this.coachType,
      required this.noOfCoach,
      required this.reqType,
      required this.trainNo,
      required this.pinkBookNo});
}
