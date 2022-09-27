// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:poko/api/api_services.dart';
import 'package:poko/const/colors.dart';
import 'package:poko/const/pokecontainer.dart';
import 'package:poko/const/txt_style.dart';
import 'package:poko/screens/Detailscreen.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Poke',
                style:
                    const TextStyle(fontFamily: 'circula_bold', fontSize: 36),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: FutureBuilder(
                      future: apiGet(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(lightGreen),
                            ),
                          );
                        } else {
                          //var data = snapshot.data;
                          return GridView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: width < 600
                                          ? 2
                                          : width < 1100
                                              ? 4
                                              : 6,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Detailscreen(
                                                  data: snapshot.data[index],
                                                )));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.red,
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: -20,
                                          right: -20,
                                          child: Image.asset(
                                            'assets/pokeball.png',
                                            width: 150,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: Image.network(
                                             snapshot.data[index]['imageurl'],
                                            width: 150,
                                          ),
                                        ),
                                        Positioned(
                                            top: 20,
                                            left: 10,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                headingtext(
                                                    text: snapshot.data[index]['name'],
                                                    size: 24,
                                                    color: Colors.white),
                                                PokContainer(
                                                    text: 'Grass',
                                                    color: Colors.white,
                                                    size: 16),
                                                const SizedBox(height: 6),
                                                PokContainer(
                                                    text: 'Poison',
                                                    color: Colors.white,
                                                    size: 16),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
