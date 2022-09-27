// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:poko/const/colors.dart';
import 'package:poko/const/pokecontainer.dart';
import 'package:poko/const/rowStyling.dart';
import 'package:poko/const/stats_row.dart';
import 'package:poko/const/txt_style.dart';
import 'package:poko/screens/landscape.dart';
import 'package:poko/screens/portraitscreen.dart';

class Detailscreen extends StatelessWidget {
  final dynamic data;
  const Detailscreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    width: double.infinity,
                    child: orientation == Orientation.portrait
                        ? portraitScreen(data)
                        : landscapeContainer())),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    TabBar(
                        labelColor: black,
                        unselectedLabelColor: grey,
                        tabs: [
                          Tab(
                            text: 'About',
                          ),
                          Tab(
                            text: 'Base Status',
                          ),
                        ]),
                    Expanded(
                        child: TabBarView(children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            normalText(
                                text: data['xdescription'],
                                size: 16,
                                color: black),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: width - 100,
                                child: Card(
                                  color: lightGrey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            headingtext(
                                                text: 'Height',
                                                size: 16,
                                                color: black),
                                            SizedBox(height: 6),
                                            headingtext(
                                                text: data['height'],
                                                size: 16,
                                                color: black)
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            headingtext(
                                                text: 'Width',
                                                size: 16,
                                                color: black),
                                            SizedBox(height: 6),
                                            headingtext(
                                                text: data['weight'],
                                                size: 16,
                                                color: black)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: headingtext(
                                    text: 'Breeding', size: 16, color: black)),
                            SizedBox(height: 10),
                            RowStyle(text: 'Gender', value: 'Male'),
                            RowStyle(
                                text: 'Egg Cycle', value: 'Grass, Monster'),
                            RowStyle(
                                text: 'Evolution', value: 'Grass, Monster'),
                          ],
                        ),
                      ),
                      Container(
                        color: lightGrey,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            RowStatus(
                                text: 'Attack',
                                value: data['attack'].toString()),
                            RowStatus(text: 'Weekness', value: '70'),
                            RowStatus(
                                text: 'Defense',
                                value: data['defense'].toString()),
                            RowStatus(text: 'HP', value: data['hp'].toString()),
                          ],
                        ),
                      )
                    ]))
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
