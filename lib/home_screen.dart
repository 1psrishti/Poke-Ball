import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokeball/pokecard.dart';
import 'package:pokeball/pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // var pokeApi = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  List? pokedex;
  late PokeModel pokeModel;

  @override
  void initState() {
    super.initState();
    if(mounted){
      fetchData();
    }
  }

  fetchData() {
    var uri = Uri.https("raw.githubusercontent.com", "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(uri).then((value) {
      if(value.statusCode == 200){
        var decodedJson = jsonDecode(value.body);
        pokedex = decodedJson['pokemon'];
        setState((){});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                "PokéBall",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: pokedex?.length,
                itemBuilder: (context, index){
                  return PokeCard(
                    index: pokedex?[index],
                    name: pokedex?[index]['name'],
                    type: pokedex?[index]['type'][0],
                    image: pokedex?[index]['img'],
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}


