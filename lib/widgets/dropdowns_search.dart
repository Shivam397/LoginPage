import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';


class DropDownSearch extends StatelessWidget {
  final List<String> ?item;
  //final List<AssetType> itemList;
  final ValueSetter<String> ? onChanged;
  String? selectedItem;

  // final ValueSetter<String> newItem;
  DropDownSearch(
      {Key? key,
      this.item,
      //required this.itemList,
      this.selectedItem,
      this.onChanged
      // required this.newItem,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
        selectedItem: selectedItem,
        //mode of dropdown
        popupProps: const PopupProps.menu(
          showSearchBox: true,
          isFilterOnline: true,
        ),
        dropdownDecoratorProps: const DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            // disabledBorder: UnderlineInputBorder.false,
            border: InputBorder.none,
            labelText: 'Select',
            contentPadding: EdgeInsets.only(top: 0),
            labelStyle: TextStyle(
                fontSize: 14,
                color: Colors.black),
            hintText: "Item List in menu mode",
          ),
        ),
        // items: item,
        // onChanged: (value) {
        //   onChanged(value!);
        // }
        );
  }

}
