library wee_drop_down;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Util.dart';

class WEEDropDownWidget extends StatelessWidget {
  late List<WeeDropDownItem> itemList;
  late WeeDropDownItem meDropDownSelectedItem;
  late Object? selectedValue;
  late Object? selectedLabel;
  late String displayValue;
  late String selectTitle;
  late Color primaryColor;
  late final FocusNode meFocusNode;
  late Color decorationColor = Colors.blue;
  late final Function(WeeDropDownItem meDropDownSelectedItem) onChangeEventItem;

  WEEDropDownWidget(
      {required this.itemList,
        required this.selectTitle,
        required this.onChangeEventItem,
        this.selectedValue ,
        this.selectedLabel,
        required this.primaryColor,
        required this.meFocusNode,
      required this.decorationColor});

  @override
  Widget build(BuildContext context) {
    WeeDropDownItem? selValue ;
    if (selectedValue != null) {
        selValue = itemList.firstWhere((element)  {
        return element.value.toString() == selectedValue.toString();
      },orElse: null);
    }
    else if(selectedLabel != null){
     selValue = itemList.firstWhere((element)  {
        return element.displayValue.toString() == selectedLabel.toString();
      });

    }


    if(selValue  == null) {
      if (itemList.length>0) {
        meDropDownSelectedItem = itemList.first;
      }
    } else {
      if(selValue != null) {
        meDropDownSelectedItem = selValue;
      }
    }
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Flexible(
              flex: 10,
              child: DropdownButtonFormField<WeeDropDownItem>(
                value: meDropDownSelectedItem,
                decoration: Util.getDropDownInputDecoration(selectTitle,decorationColor),
                items: itemList.map((WeeDropDownItem meDropDownItem) {
                  return DropdownMenuItem<WeeDropDownItem>(
                    value: meDropDownItem,
                    child: Text(meDropDownItem.displayValue,
                        textAlign: TextAlign.center,style: Theme.of(context).textTheme.displaySmall,),
                  );
                }).toList(),
                onChanged: (newValue) {
                  if (meFocusNode != null) meFocusNode.requestFocus();

                  onChangeEventItem(newValue!);
                },
              ),
            ),
            Flexible(
              flex: 0,
              child: SizedBox(
                width: 0,
                child: TextFormField(
                  focusNode: meFocusNode,
                  readOnly: true,
                  showCursor: true,
                ),
              ),
            ),
          ],
        ));
  }
}

abstract class WeeDropDownItem {
  String get value;

  String get displayValue;

  Color get barColor;
}