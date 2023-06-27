import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokeball/colors.dart';
import 'package:pokeball/detail_screen.dart';

class PokeCard extends StatelessWidget {
  final index;
  final String name;
  final String type;
  final String image;

  const PokeCard({
    Key? key,
    required this.index,
    required this.name,
    required this.type,
    required this.image,
  }) : super(key: key);

  Color cardColor(String type){
    switch(type){
      case 'Grass':
        return grass;
      case 'Fire':
        return fire;
      case 'Water':
        return water;
      case 'Poison':
        return poison;
      case 'Bug':
        return bug;
      case 'Normal':
        return normal;
      case 'Electric':
        return electric;
      case 'Ground':
        return ground;
      case 'Fighting':
        return fighting;
      case 'Psychic':
        return psychic;
      case 'Rock':
        return rock;
      case 'Ghost':
        return ghost;
      case 'Ice':
        return ice;
      case 'Dragon':
        return dragon;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(
            pokemonDetail: index,
            color: cardColor(type),
            heroTag: index,
          )));
        },
        child: Container(
          decoration: BoxDecoration(
            color: cardColor(type),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 4,
                right: 4,
                child: Hero(
                  tag: index,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    height: 100,
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Text(
                  name,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                top: 45,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    type,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
