  import 'package:flutter/material.dart';


// class RadioButton<T> extends StatefulWidget{
//     final T value;
//     T? groupValue;
//     final String label;
//     final String text;
//     final ValueChanged<T?> onChanged;
  
//     RadioButton({
//       required this.value,
//       this.groupValue,
//       required this.label,
//       required this.text,
//       required this.onChanged,
//     });

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _RadioButton();
//   }

// }

class RadioButton<T> extends StatelessWidget {
  
    final T value;
    final T? groupValue;
    final String label;
    final String text;
    final ValueChanged<T?> onChanged;
  
    const RadioButton({
      required this.value,
      required this.groupValue,
      required this.label,
      required this.text,
      required this.onChanged,
    });

      // ValueChanged<T?> _valueChangedHandler() {
      //   return (value) => setState(() => widget.groupValue = widget.value!);
      // }
  
    Widget _buildLabel() {
      final bool isSelected = value == groupValue;
  
      return Container(
        width: 15,
        height: 15,
        decoration: ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(
              color: Colors.grey,
              width: 2.0
            ),
          ),
          color: isSelected ? Colors.teal : Colors.white,
          
        ),
        // child: Center(
        //   child: Text(
        //     value.toString(),
        //     style: TextStyle(
        //       color: isSelected ? Colors.white : Colors.teal,
        //       fontSize: 24,
        //     ),
        //   ),
        // ),
      );
    }
  
    Widget _buildText() {
      return Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      );
    }
  
    @override
    Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.all(5),
        child: InkWell(
          onTap: () => onChanged(value),
          //splashColor: Colors.teal.withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                _buildLabel(),
                const SizedBox(width: 10),
                _buildText(),
              ],
            ),
          ),
        ),
      );
    }

  
  }
  

  




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class RadioButton extends StatefulWidget {
//   final val = ''.obs;
//   final String groupValue;
//   final String label;
//   final VoidCallback? callback;

//   RadioButton(
//       {Key? key,
//       required this.groupValue,
//       required this.label,
//       this.callback})
//       : super(key: key);

//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Obx(
//           () => Radio(
//             fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
//             value: val.value,
//             groupValue: groupValue,
//             onChanged: (value) {
//               //do your stuff here
//               val.value = value.toString();
//             },
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Text(
//           label,
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 12.0,
//             fontWeight: FontWeight.w500,
//             fontStyle: FontStyle.normal,
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   State<StatefulWidget> createState() {
//     throw UnimplementedError();
//   }
// }
