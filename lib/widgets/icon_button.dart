import 'package:flutter/material.dart';

class IconButtonWidget extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color? backgroundColor;
  final double? backgroundSize;
  final Color? iconColor;
  final VoidCallback? callback;
  final String? tooltip;

  const IconButtonWidget(
      {Key? key,
      required this.icon,
      required this.size,
      this.backgroundColor,
      this.backgroundSize,
      this.iconColor,
      this.callback,
      this.tooltip})
      : super(key: key);
      
        @override
        State<StatefulWidget> createState() {
          return _IconButtonWidget();
        }

  
}

 
class _IconButtonWidget extends State<IconButtonWidget>{
  @override
  Widget build(BuildContext context) {
    return 
    
//     Material(
//   type: MaterialType.transparency,
//   child: Ink(
//     decoration: BoxDecoration(
//       border: Border.all(color: widget.backgroundColor, width: 7.0),
//       color: widget.backgroundColor,
//       shape: BoxShape.circle,
//     ),
//     child: InkWell(
//       borderRadius: BorderRadius.circular(500.0),
//       onTap: () {
//         widget.callback;
//       },
//       child: Padding(
//         padding: EdgeInsets.all(5.0),
//         child: Icon(
//           widget.icon,
//           size: 10,
//           color: Colors.white,
//         ),
//       ),
//     ),
//   ),
// );
    
    
    Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: CircleAvatar(
          backgroundColor: widget.backgroundColor,
          radius: widget.backgroundSize,
          child: IconButton(
            iconSize: widget.size,
            icon: Icon(
              widget.icon,
              //color: widget.iconColor,
              color: Colors.white,
            ),
            //color: backgroundColor,
            onPressed: widget.callback,
            
            tooltip: widget.tooltip,
          ),
        ));
  }
}
