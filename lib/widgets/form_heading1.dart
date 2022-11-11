import 'package:first_app/widgets/Responsive.dart';
import 'package:flutter/material.dart';
import 'Responsive.dart';



class FormHeading1 extends StatelessWidget {
  final String text;

  FormHeading1({required this.text});

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Responsive.isDesktop(context)) ? 
        Text(text, textAlign: TextAlign.left , style: TextStyle(color: Color.fromARGB(255, 95, 94, 94),fontWeight: FontWeight.w800,fontSize: 20,),) :

        Text(text,style: TextStyle(color: Color.fromARGB(255, 95, 94, 94),fontWeight: FontWeight.w800,fontSize: 16),)
    );
    
      
  }
}
