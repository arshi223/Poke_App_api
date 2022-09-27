// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:poko/const/pokecontainer.dart';
import 'package:poko/const/txt_style.dart';

Widget portraitScreen(data) {
  return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headingtext(text: data['name'], size: 36, color: Colors.white),
                  Row(
                    children: [
                      PokContainer(
                          text: 'Grass', size: 16, color: Colors.white),
                      SizedBox(width: 6),
                      PokContainer(
                          text: 'Poison', size: 16, color: Colors.white),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                     // alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          'assets/pokeball.png',
                          width: 200,
                          color: Colors.white.withOpacity(0.40),
                        ),
                        Image.network(
                          data['imageurl']
                          //'assets/img1.png',
                          ,
                          width: 180,
                        )
                      ],
                    ),
                  )
                ],
              );
}
