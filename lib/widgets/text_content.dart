import 'package:first_app/widgets/Responsive.dart';
import 'package:flutter/material.dart';


class TextContent extends StatelessWidget {
  final String text;

  TextContent({required this.text});

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Responsive.isDesktop(context)) ? 
        Text(text,style: const TextStyle(color: Color.fromARGB(255, 104, 103, 103),fontWeight: FontWeight.w400,fontSize: 16,),) :

        Text(text,style: const TextStyle(color: Color.fromARGB(255, 104, 103, 103),fontWeight: FontWeight.w400,fontSize: 14),)
    );
    
    
      
  }
  
}
