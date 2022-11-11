
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:first_app/widgets/Responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeFields extends StatelessWidget{
  final String label;

  DateTimeFields({required this.label});

  DateTime now = DateTime.now();
  DateFormat format = DateFormat("dd-MM-yyyy HH:MM");

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: (Responsive.isDesktop(context)) ?

        Container(
          margin: EdgeInsets.only(right: _size.width/6),
          child: DateTimeF(),
        ) :

        DateTimeF(),

      
      
    );
    
  }

  Widget DateTimeF()
  {
    return DateTimeField(
        decoration: InputDecoration(
          hintText: "dd-mm-yyyy HH:MM",
          labelText: this.label,
          labelStyle: const TextStyle(color: Colors.grey),
          focusColor: Colors.white,
          contentPadding: const EdgeInsets.all(10),
        ),
        style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));

          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              builder: (context, childWidget) {
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(alwaysUse24HourFormat: true),
                  child: childWidget!,
                );
              },
            );

            return DateTimeField.combine(date, time);
          } else {
            return date;
          }
        });
  }

}