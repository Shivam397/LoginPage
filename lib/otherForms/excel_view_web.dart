import 'dart:io';

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

Future<void> createExcelForWeb(int stIndex, int _entry) async {
  final Workbook workbook = Workbook();
  final Worksheet sheet = workbook.worksheets[0];
  //Globalkey.currentState!.exportToExcelWorksheet(sheet);
  sheet.getRangeByName('A1').setText("Order ID");
  sheet.getRangeByName('B1').setText("Order Ref No");
  sheet.getRangeByName('C1').setText("Head of Allocation");
  sheet.getRangeByName('D1').setText("Manufacturer/PU");
  sheet.getRangeByName('E1').setText("Order Date");
  sheet.getRangeByName('F1').setText("Order Description");

  sheet.getRangeByName('A1').cellStyle.backColor = '#008080';
  sheet.getRangeByName('B1').cellStyle.backColor = '#008080';
  sheet.getRangeByName('C1').cellStyle.backColor = '#008080';
  sheet.getRangeByName('D1').cellStyle.backColor = '#008080';
  sheet.getRangeByName('E1').cellStyle.backColor = '#008080';
  sheet.getRangeByName('F1').cellStyle.backColor = '#008080';

  sheet.getRangeByName('A1').autoFitColumns();
  sheet.getRangeByName('B1').autoFitColumns();
  sheet.getRangeByName('C1').autoFitColumns();
  sheet.getRangeByName('D1').autoFitColumns();
  sheet.getRangeByName('E1').autoFitColumns();
  sheet.getRangeByName('F1').autoFitColumns();

   sheet.getRangeByName('A1').autoFitRows();
  sheet.getRangeByName('B1').autoFitRows();
  sheet.getRangeByName('C1').autoFitRows();
  sheet.getRangeByName('D1').autoFitRows();
  sheet.getRangeByName('E1').autoFitRows();
  sheet.getRangeByName('F1').autoFitRows();

  int index = 2;
  for (var i = stIndex;
      i <
          (order.getOrders().length - stIndex < _entry
              ? order.getOrders().length
              : stIndex + _entry);
      i++) {
    sheet
        .getRangeByName('A' + '${index}'.toString())
        .setText('${order.getOrders()[i].orderId}');
    sheet
        .getRangeByName('B' + '${index}'.toString())
        .setText('${order.getOrders()[i].orderRefNum}');
    sheet
        .getRangeByName('C' + '${index}'.toString())
        .setText('${order.getOrders()[i].headOfAllocation}');
    sheet
        .getRangeByName('D' + '${index}'.toString())
        .setText('${order.getOrders()[i].Manufacturer}');
    sheet
        .getRangeByName('E' + '${index}'.toString())
        .setText('${order.getOrders()[i].orderDate}');
    sheet
        .getRangeByName('F' + '${index}'.toString())
        .setText('${order.getOrders()[i].orderDescription}');
    index++;
  }

  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();

  if (kIsWeb) {
    AnchorElement(
        href:
            'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', 'Output.xlsx')
      ..click();
  } else {
    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName = '$path/Output.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);
  }
}
//}

