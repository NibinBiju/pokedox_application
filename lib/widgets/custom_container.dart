import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedox_application/constants/images/image.dart';

class CustomSpeciesContainer extends StatelessWidget {
  const CustomSpeciesContainer({
    super.key,
    required this.index,
    required this.speciesName,
  });

  final int index;
  final String speciesName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 46, 46, 46),
            offset: Offset(
              3.0,
              3.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 231, 231, 231),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //number
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '#${index + 1}',
                      style: const TextStyle(
                        fontSize: 23,
                        color: Colors.black87,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                //image
                SizedBox(
                  width: 130,
                  height: 140,
                  child: Hero(
                    tag: '$index',
                    // child: Image.network(
                    //   'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
                    //   fit: BoxFit.cover,
                    // ),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Lottie.asset(
                          'assets/lottie/Animation - 1729581357918.json'),
                      imageUrl:
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Image.asset(
                        pokemonBallPng,
                      ),
                    ),
                  ),
                ),
                //name
                Text(
                  speciesName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
