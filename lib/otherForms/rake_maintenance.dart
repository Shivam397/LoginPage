import 'package:first_app/otherForms/fetch_rake.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../widgets/Responsive.dart';
import '../widgets/widgets.dart';

class RakeMaintenance extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RakeMaintenance();
  }

}

class _RakeMaintenance extends State<RakeMaintenance> {
  @override
  Widget build(BuildContext context) {
    //print(selectedValue);
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("../lib/images/background-image.png"),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (Responsive.isDesktop(context)) ...[
                  Container(
                    width: 500,
                    height: 650,
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.orangeAccent, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: rakeView(context),
                  ),
                ] else ...[
                  Container(
                    width: 300,
                    height: 650,
                    child: rakeView(context),
                  )
                ],
              ],
            ),
          ),
        ));
  }

  Widget rakeView(BuildContext context) {
    var selectedValue = "NMGT";

    final list = RadioModel(false, "Passenger Train", selectedValue,
        "Passenger Train");
    final list2 =
        RadioModel(false, "NMGT", selectedValue, "NMG Train");
    final list3 = RadioModel(
        false, "Parcel Train", selectedValue, "Parcel Train");

    print(selectedValue);

    return Card(
      elevation: 100,
      shadowColor: Colors.grey,
      child: Column(
        children: [
          CustomRadio(sampleData: [list, list2, list3]),

          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: LabelText(
                    text: "Outward Train No",
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InputField(
                    //password: false,
                    width: 60,
                    //color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: LabelText(
                    text: "Start Date",
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: CustomDateField(
                    label: "DD/MM/YYYY",
                  ),
                ),
              ],
            ),
          ),

          // const SizedBox(
          //   height: 5,
          // ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Button(label: "OK", color: Colors.orangeAccent),
              )
            ],
          ),

          SingleChildScrollView(
            child: (selectedValue == "NMGT") ? NMGTrain() : Container(),
          ),
        ],
      ),
    );
  }

  Widget NMGTrain() {
    return Padding(padding: EdgeInsets.all(20),
    child:Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
      child: Padding(padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          FormHeading2(text: "Coaching"),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: LabelText(text: "Fois Rake Id"),
              ),
              Expanded(
                flex: 2,
                child: InputField(
                  width: 100,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: LabelText(text: "Rake Name"),
              ),
              Expanded(
                flex: 2,
                child: InputField(
                  width: 100,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: LabelText(text: "Yard Section"),
              ),
              Expanded(
                flex: 2,
                child: InputField(
                  width: 100,
                ),
              )
            ],
          ),
        ],
      ),
      )
      
    ));
  }
}
