import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxWidget extends StatefulWidget{
  final  isChecked = false.obs;
  final String groupValue;
  final String label;
  final VoidCallback? callback;

   CheckBoxWidget({required this.groupValue,required this.label,this.callback});


  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: SizedBox(
        width: Checkbox.width,
        height: Checkbox.width,
        child: Container(
          decoration: new BoxDecoration(
            border: Border.all(
              width: 1,
            ),
            borderRadius: new BorderRadius.circular(5),
          ),
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.transparent,
            ),
            child: Checkbox(
              value: isChecked.value,
              onChanged: (state) =>
                  isChecked.value = !isChecked.value,
              activeColor: Colors.transparent,
              checkColor: Colors.blue,
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ),
          ),
        ),
      ),
    );
    
    // Center(
    //       child: InkWell(
    //     onTap: () {
    //         isChecked.value = !isChecked.value;
          
    //     },
    //     child: Container(
    //       decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
    //       child: Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: isChecked.value
    //             ? Icon(
    //                 Icons.check,
    //                 size: 30.0,
    //                 color: Colors.white,
    //               )
    //             : Icon(
    //                 Icons.check_box_outline_blank,
    //                 size: 30.0,
    //                 color: Colors.blue,
    //               ),
    //       ),
    //     ),
    //   ));

  //  bool isChecked = false;

    // return Row(
    //   children: [
    //     Obx(()=>
    //     CustomCheckBox(
    //           value: isChecked.value,
    //           shouldShowBorder: true,
    //           borderColor: Colors.black,
    //           checkedFillColor: Colors.teal,
    //           borderRadius: 8,
    //           borderWidth: 1,
    //           checkBoxSize: 22,
    //           onChanged: (val) {
    //             //do your stuff here
             
    //               isChecked.value = val;
                
    //           },
    //         ),
    //     ),

    //         // const SizedBox(
    //         //   height: 20,
    //         // ),

    //       Text(label,
    //       style: const TextStyle(
    //             color: Colors.black,
    //             fontSize: 12.0,
    //             fontWeight: FontWeight.w500,
    //             fontStyle: FontStyle.normal,
    //           ),
    //       ),
    //   ],
    // );
  }
  
  @override
  State<StatefulWidget> createState() {
  
    throw UnimplementedError();
  }

}

