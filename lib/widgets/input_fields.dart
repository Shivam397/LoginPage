// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? placeholder;
  final bool? password;
  final double? width;
  //final Color? color; 
  final String? Function(String?)? validator;

  const InputField({
    Key? key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.placeholder,
    this.password,
    this.width,
    //this.color,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(right: 50.0),
      width:width,
      child: TextFormField(
      
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
        focusedBorder:const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,

          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // labelStyle: TextStyle(
        //   fontSize: fontSize - 2,
        //   color: color,
        //   height: 0.2,
        //   fontWeight: FontWeight.normal,
        // ),
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.blueGrey[300],
          fontWeight: FontWeight.normal,
        ),
        filled: true,
        isDense: true,
      ),
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      keyboardType: keyboardType,

      //obscureText: this.password!,
      autocorrect: false,
      validator: validator,
    ),
    );
    
    
  }
}
