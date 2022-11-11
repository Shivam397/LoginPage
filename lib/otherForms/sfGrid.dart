import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:first_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class sfGrid extends StatelessWidget {
  var _curr = ['2022-23', '2023-24', '2024-25'];
  var _currency = '2022-23'.obs;
  var newOrder = false.obs;

  var _entries = ['5', '10', '15', '20'];
  var _entry = '5'.obs;

  int _rowsPerPage=10;
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
                        //child: placeOrderforMobile(),
                      )),
      ),
    );
  }

  Widget view(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              Container(
                height: constraints.maxHeight - datapagerHeight,
                child: SfDataGrid(
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
      ]),
              ),
              Container(
                  height: datapagerHeight,
                  child: SfDataPager(
                    delegate: orderDataSource,
                    availableRowsPerPage: [10, 20, 30],
                    onRowsPerPageChanged: (int? rowsPerPage) {
                      // setState(() {
                      //   _rowsPerPage = rowsPerPage!;
                      //   employeeDataSource.updateDataGriDataSource();
                      // });
                    },
                    pageCount:
                        ((orders.length / _rowsPerPage).ceil()).toDouble(),
                  )),
            ],
          );
        })
      ],
    );
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

  // @override
  // Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) {
  //   final int _startIndex = newPageIndex * _rowsPerPage;
  //   int _endIndex = _startIndex + _rowsPerPage;
  //   if (_endIndex > _orderData.length) {
  //     _endIndex = _orderData.length;
  //   }

  //   /// Get particular range from the sorted collection.
  //   if (_startIndex < _orderData.length &&
  //       _endIndex <= _orderData.length) {
  //     _paginatedRows = _orderData.getRange(_startIndex, _endIndex).toList();
  //   } else {
  //     _paginatedRows = <order>[];
  //   }
  //   buildDataGridRow();
  //   notifyListeners();
  //   return Future<bool>.value(true);
  // }

  void updateDataGriDataSource() {
    notifyListeners();
  }
}

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
    ];
  }
}


