import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final pokemonDetail;
  final Color color;
  final heroTag;

  const DetailPage({
    Key? key,
    required this.pokemonDetail,
    required this.color,
    required this.heroTag,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: widget.color,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 32,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              top: 65,
              left: 12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.pokemonDetail['name'],
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      widget.pokemonDetail['type'].join(', '),
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                width: width,
                height: height * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          width: width * 0.35,
                          child: Text("Name", style: detailTitleStyle),
                        ),
                        Text(widget.pokemonDetail['name'], style: detailStyle),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          width: width * 0.35,
                          child: Text("Height", style: detailTitleStyle),
                        ),
                        Text(widget.pokemonDetail['height'],
                            style: detailStyle),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          width: width * 0.35,
                          child: Text("Weight", style: detailTitleStyle),
                        ),
                        Text(widget.pokemonDetail['weight'],
                            style: detailStyle),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          width: width * 0.35,
                          child: Text("Spawn Time", style: detailTitleStyle),
                        ),
                        Text(widget.pokemonDetail['spawn_time'],
                            style: detailStyle),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          width: width * 0.35,
                          child: Text("Weakness", style: detailTitleStyle),
                        ),
                        Flexible(
                          child: Text(widget.pokemonDetail['weaknesses'].join(', '),
                              overflow: TextOverflow.visible,
                              style: detailStyle),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          width: width * 0.35,
                          child:
                              Text('Prev Evolution', style: detailTitleStyle),
                        ),
                        widget.pokemonDetail['prev_evolution'] != null
                            ? SizedBox(
                                height: 20,
                                width: width * 0.5,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget
                                      .pokemonDetail['prev_evolution'].length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Text(
                                          widget.pokemonDetail['prev_evolution']
                                              [index]['name'],
                                          style: detailStyle),
                                    );
                                  },
                                ),
                              )
                            : Text("Just Hatched", style: detailStyle),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          width: width * 0.35,
                          child:
                              Text('Next Evolution', style: detailTitleStyle),
                        ),
                        widget.pokemonDetail['next_evolution'] != null
                            ? SizedBox(
                                height: 20,
                                width: width * 0.5,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget
                                      .pokemonDetail['next_evolution'].length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Text(
                                          widget.pokemonDetail['next_evolution']
                                              [index]['name'],
                                          style: detailStyle),
                                    );
                                  },
                                ),
                              )
                            : Text("Maxed Out", style: detailStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 150,
              child: Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: widget.heroTag,
                  child: CachedNetworkImage(
                    imageUrl: widget.pokemonDetail['img'],
                    height: 150,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle detailTitleStyle = GoogleFonts.poppins(
  color: Colors.black87,
  fontWeight: FontWeight.w500,
  fontSize: 14,
);

TextStyle detailStyle = GoogleFonts.poppins(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 16,
);
