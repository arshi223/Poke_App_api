import 'package:flutter/material.dart';
import 'package:poko/const/colors.dart';
import 'package:poko/const/txt_style.dart';

Widget RowStyle({String? text, String? value}) {
  return Row(
    children: [
      SizedBox(
          width: 100, child: headingtext(text: text, size: 16, color: black)),
      headingtext(text: value, size: 16, color: black)
    ],
  );
}
