// import 'dart:async';
// import 'dart:convert';
// import 'dart:js' as js;
// import 'dart:ui';

// import 'package:syncfusion_flutter_pdf/pdf.dart';

// Future<void> createPDF() async {
//   //Create a new PDF document
//   PdfDocument document = PdfDocument();

//   //Add a new page and draw text
//   document.pages.add().graphics.drawString(
//       'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 20),
//       brush: PdfSolidBrush(PdfColor(0, 0, 0)),
//       bounds: Rect.fromLTWH(0, 0, 500, 50));

//   //Save the document
//   List<int> bytes = await document.save();

//   //Dispose the document
//   document.dispose();

//   js.context['pdfData'] = base64.encode(bytes);
//   js.context['filename'] = 'Output.pdf';
//   Timer.run(() {
//     js.context.callMethod('download');
//   });
// }

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../otherForms/orderModel.dart';
import 'package:get/get.dart';

class createPDF extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    int stIndex = Get.arguments[0];
    int _entry = Get.arguments[1];
    // var endIndex = (order.getOrders().length - stIndex < _entry
    //           ? order.getOrders().length
    //           : stIndex + _entry)
    //print(val);
    return Scaffold(
      appBar: AppBar(title: const Text('Create Pdf for Web')),
      body: PdfPreview(
        build: (format) => _generatePdf(format, stIndex, _entry),
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        pdfFileName: 'Order_Details.pdf',
      ),
    );
  }
}

//Uint8List

Future<Uint8List> _generatePdf(
    PdfPageFormat format, int stIndex, int _entry) async {
  //BpcPrintController controller = Get.find();
  int extraindex = -4;
  final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
  //final font = await PdfGoogleFonts.nunitoExtraLight()

  var i;

  pdf.addPage(
    pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(children: [
            pw.Text("Order Details"),
            pw.Divider(),
            pw.Table(
                border:
                    pw.TableBorder.all(style: pw.BorderStyle.solid, width: 1),
                children: [
                  pw.TableRow(children: [
                    pw.Expanded(
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(4.0),
                              child: pw.Text('Order Id',
                                  style: pw.TextStyle(fontSize: 8.0),
                                  textAlign: pw.TextAlign.left),
                            ),
                          ]),
                    ),
                    pw.Expanded(
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(4.0),
                              child: pw.Text('Order Ref No',
                                  style: pw.TextStyle(fontSize: 8.0),
                                  textAlign: pw.TextAlign.left),
                            ),
                          ]),
                    ),
                    pw.Expanded(
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(4.0),
                              child: pw.Text('Head of Allocation',
                                  style: pw.TextStyle(fontSize: 8.0),
                                  textAlign: pw.TextAlign.left),
                            ),
                          ]),
                    ),
                    pw.Expanded(
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(4.0),
                              child: pw.Text('Manufacturer/PU',
                                  style: pw.TextStyle(fontSize: 8.0),
                                  textAlign: pw.TextAlign.left),
                            ),
                          ]),
                    ),
                    pw.Expanded(
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(4.0),
                              child: pw.Text('Order Date',
                                  style: pw.TextStyle(fontSize: 8.0),
                                  textAlign: pw.TextAlign.left),
                            ),
                          ]),
                    ),
                    pw.Expanded(
                      child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(4.0),
                              child: pw.Text('Order Description',
                                  style: pw.TextStyle(fontSize: 8.0),
                                  textAlign: pw.TextAlign.left),
                            ),
                          ]),
                    ),
                  ]),

                  for (i = stIndex;
                      i <
                          (order.getOrders().length - stIndex < _entry
                              ? order.getOrders().length
                              : stIndex + _entry);
                      i++)
                    pw.TableRow(children: [
                      pw.Expanded(
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.all(4.0),
                                child: pw.Text(
                                    '${order.getOrders()[i].orderId}',
                                    style: pw.TextStyle(fontSize: 8.0),
                                    textAlign: pw.TextAlign.left),
                              ),
                            ]),
                      ),
                      pw.Expanded(
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.all(4.0),
                                child: pw.Text(
                                    '${order.getOrders()[i].orderRefNum}',
                                    style: pw.TextStyle(fontSize: 8.0),
                                    textAlign: pw.TextAlign.left),
                              ),
                            ]),
                      ),
                      pw.Expanded(
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.all(4.0),
                                child: pw.Text(
                                    '${order.getOrders()[i].headOfAllocation}',
                                    style: pw.TextStyle(fontSize: 8.0),
                                    textAlign: pw.TextAlign.left),
                              ),
                            ]),
                      ),
                      pw.Expanded(
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.all(4.0),
                                child: pw.Text(
                                    '${order.getOrders()[i].Manufacturer}',
                                    style: pw.TextStyle(fontSize: 8.0),
                                    textAlign: pw.TextAlign.left),
                              ),
                            ]),
                      ),
                      pw.Expanded(
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.all(4.0),
                                child: pw.Text(
                                    '${order.getOrders()[i].orderDate}',
                                    style: pw.TextStyle(fontSize: 8.0),
                                    textAlign: pw.TextAlign.left),
                              ),
                            ]),
                      ),
                      pw.Expanded(
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.all(4.0),
                                child: pw.Text(
                                    '${order.getOrders()[i].orderDescription}',
                                    style: pw.TextStyle(fontSize: 8.0),
                                    textAlign: pw.TextAlign.left),
                              ),
                            ]),
                      ),
                    ])
                  
                ])
          ]);
        }),
  );

  return pdf.save();
}
