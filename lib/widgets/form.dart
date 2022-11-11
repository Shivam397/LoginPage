import 'package:first_app/widgets/check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';
import 'package:get/get.dart';



class form extends StatelessWidget{
  const form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxString select = "".obs;
    final list = RadioModel(false,'M',select.value, 'Male');
    final list2 = RadioModel(false, 'F',select.value, 'Female');
    final list3 = RadioModel(false,"O",select.value,"Others");

    var selected = "".obs;
  var listItem = ['A','B'];


    return Scaffold(
      //appBar: AppBar(title: Text("Form")),
      body: ListView(
          //child: Padding(padding: EdgeInsets.all(10),
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(children: [
                    FormHeading1(text: "Form Details:"),
                  ]),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(children: [
                    FormHeading2(text: "Form SubHeading"),
                  ]),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: LabelText(text: "Username"),
                      ),
                      //const SizedBox(:10),
                      Expanded(
                        child: InputField(password: false,),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  
                //CustomRadio(sampleData: [list,list2,list3]),

                DropDownWidget(selected: selected,listItem: listItem,),


                  Row(
                    children: [
                      Expanded(
                        child: LabelText(text: "Password"),
                      ),
                      //const SizedBox(height:10),
                      Expanded(
                        child: InputField(password: false,),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: LabelText(text: "Date"),
                      ),
                      //const SizedBox(height:10),
                      Expanded(
                        child: CustomDateField(label: "Date"),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: LabelText(text: "DateTime"),
                      ),
                      //const SizedBox(height:10),
                      Expanded(
                        child: DateTimeFields(label: "Date"),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      IconButtonWidget(
                          icon: Icons.attach_email,
                          backgroundColor: Colors.blue,size: 20,callback: () {
                            print("hello");
                          }
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      Button(
                          label: "Generate Rsc asdff bskejdflk",
                          color: Colors.teal),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LabelText(text: "Choose Option"),
                    ],
                  ),
                  //const Divider(),
                  
                  Row(
                    children: [],
                  ),
                ],
              ),
            ),
          ]),
    );
  }

}
