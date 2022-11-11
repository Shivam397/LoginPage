import 'package:flutter/material.dart';


class TextContent extends StatelessWidget {
  final String text;

  TextContent({required this.text});

  
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: Color.fromARGB(255, 104, 103, 103),fontWeight: FontWeight.w400,fontSize: 12),);
      
  }
  
}
