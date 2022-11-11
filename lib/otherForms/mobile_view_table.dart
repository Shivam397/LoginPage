import 'package:first_app/widgets/form_heading2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/widgets.dart';

class mobileView extends StatelessWidget {
  List<String> columns = ['zone','Total',
    'Jan-2022',
    'Feb-2022',
    'Mar-2022',
    'Apr-2022',
    'May-2022',
    'June-2022',
    'July-2022',
    'Aug-2022'
  ];
  List<List<String>> rows = [['CR','100', '10', '10', '10', '5', '5', '5', '20','10'],['ZR','100', '10', '10', '10', '5', '5', '5', '20','10'],['MR','100', '10', '10', '10', '5', '5', '5', '20','10']];

  var mon = '2'.obs;

  List<DataRow> _testRows() {
    return [
      DataRow(
        
        cells: [
          DataCell(
            Container(
              width: 50,
              child: 
              ListView.builder(
                shrinkWrap: true,
                //physics: NeverScrollableScrollPhysics(),
                itemCount: rows.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  
                  return LabelText(text: rows[index][0]);
                },
              ),
            ),
          ),
          DataCell(
            Container(
              width: 50,
              child: 
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: rows.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return LabelText(text: rows[index][1]);
                },
              ),
            ),
          ),
          DataCell(
            Container(
              width: 50,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: rows.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return LabelText(text: "${rows[index][int.parse(mon.value)]}");
                },
              ),
            ),
          ),
          DataCell(
            Container(
              width: 50,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: rows.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return LabelText(text: "${rows[index][int.parse(mon.value)+1]}");
                },
              ),
            ),
          ),
          DataCell(
            Container(
              width: 50,
            ),
          ),
          DataCell(
            Container(
              width: 50,
            ),
          ),
          
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: SingleChildScrollView(
          //scrollDirection: Axis.horizontal,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              
              Obx(() => Expanded(child: DataTable(
                columnSpacing: 10,
                    columns: [
                      DataColumn(
                          label: FormHeading2(
                        text: "Zone",
                      )),
                      DataColumn(
                          label: FormHeading2(
                        text: "Total",
                      )),
                      DataColumn(
                          label: FormHeading2(
                        text: "${columns[int.parse(mon.value)]}",
                      )),
                      DataColumn(
                          label: FormHeading2(
                        text: "${columns[int.parse(mon.value) + 1]}",
                      )),
                      DataColumn(
                        label: IconButtonWidget(
                          icon: Icons.arrow_circle_right,
                          size: 16,
                          backgroundSize: 18,
                          backgroundColor: ((int.parse(mon.value) + 2) < columns.length - 1) ? Colors.orangeAccent.shade200: Colors.grey,
                          callback:
                              ((int.parse(mon.value) + 2) < columns.length - 1)
                                  ? () {
                                      mon.value =
                                          (int.parse(mon.value) + 2).toString();
                                    }
                                  : null,
                        ),
                      ),
                      DataColumn(
                        label: IconButtonWidget(
                            icon: Icons.arrow_circle_left,
                            size: 16,
                            backgroundSize: 18,
                            backgroundColor: ((int.parse(mon.value) - 2) >= 2) ? Colors.orangeAccent.shade200 : Colors.grey,
                            callback: ((int.parse(mon.value) - 2) >= 2)
                                ? () {
                                    print(mon.value);
                                    mon.value =
                                        (int.parse(mon.value) - 2).toString();
                                  }
                                : null),
                      ),
                    ],
                    rows: _testRows()
                    // [
                    //   DataRow(cells: [
                    //     DataCell(LabelText(text: "${rows[0]}")),
                    //     DataCell(LabelText(text: "${rows[1]}")),
                    //     DataCell(
                    //         LabelText(text: "${rows[int.parse(mon.value)]}")),
                    //     DataCell(LabelText(
                    //         text: "${rows[int.parse(mon.value) + 1]}")),
                    //     DataCell(LabelText(text: "")),
                    //     DataCell(LabelText(text: "")),
                    //   ])
                    // ],
                  ))),
              
            ],
          )),
    )));
  }
}

class Details{
  final String zone;
  final double total;
  final double jan;
  final double feb;
  final double mar;
  final double Apr;
  final double May;
  final double June;
  final double july;
  final double Aug;

  Details({required this.zone,required this.total,required this.jan,required this.feb,required this.mar,required this.Apr,required this.May,required this.June,required this.july,required this.Aug});

  static List<Details> getDetails(){
    return [
      Details(zone:"CR",total: 100,jan:10,feb:10,mar:10,Apr:10,May:10,June:5,july:5,Aug:10),
      Details(zone:"CR",total: 100,jan:10,feb:10,mar:10,Apr:10,May:10,June:5,july:5,Aug:10),
      Details(zone:"CR",total: 100,jan:10,feb:10,mar:10,Apr:10,May:10,June:5,july:5,Aug:10),
      Details(zone:"CR",total: 100,jan:10,feb:10,mar:10,Apr:10,May:10,June:5,july:5,Aug:10),
      Details(zone:"CR",total: 100,jan:10,feb:10,mar:10,Apr:10,May:10,June:5,july:5,Aug:10),
    ];
  }

}
