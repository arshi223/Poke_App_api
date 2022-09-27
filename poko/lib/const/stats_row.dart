import 'package:flutter/material.dart';
import 'package:poko/const/colors.dart';
import 'package:poko/const/txt_style.dart';

Widget RowStatus({String? text, String? value}) {
  var RowWidth = int.parse(value.toString());
  return Row(
    children: [
      SizedBox(
          width: 100, child: headingtext(text: text, color: black, size: 16)),
      SizedBox(
          width: 100, child: headingtext(text: value, color: black, size: 16)),
      Container(
        height: 3,
        width: RowWidth.toDouble(),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.red),
      )
    ],
  );
}
