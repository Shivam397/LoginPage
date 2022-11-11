import 'package:flutter/material.dart';

import 'Responsive.dart';



class FormHeading2 extends StatelessWidget {
  final String text;

  FormHeading2({required this.text});

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Responsive.isDesktop(context)) ? 
        Text(text,style: TextStyle(color: Color.fromARGB(255, 95, 94, 94),fontWeight: FontWeight.w600,fontSize: 16),) :

        Text(text,style: TextStyle(color: Color.fromARGB(255, 95, 94, 94),fontWeight: FontWeight.w600,fontSize: 12),)
    );
    
    
    
      
  }
}
