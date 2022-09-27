import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var link =
    "https://raw.githubusercontent.com/hungps/flutter_pokedex/master/assets/pokemons.json";
apiGet() async {
  var response = await http.get(Uri.parse(link));
  if (response.statusCode == 200) {
    //print('response received');
    var data = jsonDecode(response.body.toString());
    return data;
  }
}
