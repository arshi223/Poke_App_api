import 'package:flutter/material.dart';
import 'package:poko/const/txt_style.dart';

Widget PokContainer({String? text, Color? color, double? size}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.30),
        borderRadius: BorderRadius.circular(12)),
    child: normalText(text: text, color: color, size: size),
  );
}
