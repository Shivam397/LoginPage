import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';
import '../otherForms/orderModel.dart';

// class tryExcel extends StatelessWidget{

//   //final GlobalKey<FormState> Key = GlobalKey<FormState>();
//   final Globalkey;
//   tryExcel({required this.Globalkey});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(onPressed: createExcel, child: Text("Create Excel")),
//       ),
//     );
//   }

var i;

Future<void> createCSVForWeb(int stIndex, int _entry) async {
  //  final Workbook workbook = Workbook();
  // final Worksheet sheet = workbook.worksheets[0];

  List<List<dynamic>> rows = [];
  //downloadData() {
    for (int i = stIndex; i < (order.getOrders().length - stIndex < _entry
                              ? order.getOrders().length
                              : stIndex + _entry); i++) {

      List<dynamic> row = [];
      row.add(order.getOrders()[i].orderId);
      row.add(order.getOrders()[i].orderRefNum);
      row.add(order.getOrders()[i].headOfAllocation);
      row.add(order.getOrders()[i].Manufacturer);
      row.add(order.getOrders()[i].orderDate);
      row.add(order.getOrders()[i].orderDescription);
      rows.add(row);
    }

    //  final List<int> bytes = workbook.saveAsStream();
    //  workbook.dispose();

    String csv = const ListToCsvConverter().convert(rows);
    if (kIsWeb) {
      AnchorElement(href: "data:text/plain;charset=utf-8,$csv")
      ..setAttribute("download", "data.csv")
      ..click();
  } else {
    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName = '$path/data.csv';
    final File file = File(fileName);
    await file.writeAsString(csv);
    OpenFile.open(fileName);
  }
}


