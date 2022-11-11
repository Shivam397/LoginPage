import 'package:first_app/widgets/Responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';



class Button extends StatelessWidget {
  final String label;
  final Color color;
  final double? width;
  final VoidCallback? callback;

  const Button({
    Key? key,required this.label, required this.color, this.width,this.callback,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return 
    //ElevatedButton(onPressed: onPressed, child: child)
    SizedBox(
      width: width,
      child: NeumorphicButton(
      
      style: NeumorphicStyle(
        shape: NeumorphicShape.convex,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(20),
        ),
        border: NeumorphicBorder(
          color: color,
          width: 0.8,
        ),
        intensity: 0.5,
        depth: 12, //customize depth here
        color: color,
        surfaceIntensity: 0.5,
        
      ),
      child: (Responsive.isDesktop(context))? 
      Text(label, style: TextStyle(color: Colors.white,fontSize: 16,overflow: TextOverflow.clip),):
      Text(label, style: TextStyle(color: Colors.white,fontSize: 13,overflow: TextOverflow.clip),),
      
      onPressed: callback,
    ),
    );
    
    
}

}
