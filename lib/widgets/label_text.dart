import 'package:flutter/material.dart';

import 'Responsive.dart';



class LabelText extends StatelessWidget {
  final String text;

  LabelText({required this.text});

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Responsive.isDesktop(context)) ? 
        Text(text,style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 16),) :

        Text(text,style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 13),)
    );
    
    
      
  }
  
}
