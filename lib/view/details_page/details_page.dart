import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pokedox_application/controller/pokemon_controller.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(
      {super.key,
      required this.index,
      required this.image,
      required this.speciesName});
  final int index;
  final String image;
  final String speciesName;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // @override
  // void initState() {
  //   Provider.of<PokemonController>(context, listen: false)
  //       .pokemonDetailsApi(specieName: widget.speciesName);
  //   super.initState();
  // }

  List statsDummy = ['HP', 'ATK', 'DEF', 'SATK', 'SDEF', 'SPD'];

  @override
  Widget build(BuildContext context) {
    List physicalApperance = [
      [
        'Weight',
        "${Provider.of<PokemonController>(context, listen: false).pokemonSpeciesDetails?.weight ?? 0} Kg"
      ],
      [
        'Height',
        "${Provider.of<PokemonController>(context, listen: false).pokemonSpeciesDetails?.height ?? 0} m"
      ],
      [
        'Abilities',
        Provider.of<PokemonController>(context, listen: false)
            .pokemonSpeciesDetails
            ?.abilities?[0]
            .ability
            ?.name
      ],
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var pokemonProvider = Provider.of<PokemonController>(context);
    // String valueString =
    //     (pokemonProvider.pokemonSpeciesDetailsTwo?.color?.name ?? "")
    //         .split('(0x')[1]
    //         .split(')')[0];
    // int value = int.parse(valueString, radix: 16);
    // print("Value:$value");
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 35),
                      height: height * 0.4,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Stack(
                        children: [
                          // Background image
                          Positioned(
                            right: 0,
                            child: Opacity(
                              opacity: 0.1,
                              child: SizedBox(
                                width: width * 0.7,
                                height: height * 0.3,
                                child: Image.asset(
                                    'assets/images/PngItem_202138.png'),
                              ),
                            ),
                          ),
                          // Header content
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BackButton(
                                  color: Colors.white,
                                  onPressed: () => Navigator.pop,
                                ),
                                Text(
                                  widget.speciesName,
                                  style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const Text(
                                  '#1',
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Body content
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Abilities section
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                2,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      color: Colors.green,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 12,
                                      ),
                                      child: const Text(
                                        'Grass',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // About section
                          const Text(
                            'About',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Physical appearance section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              3,
                              (index) => IntrinsicHeight(
                                child: Row(
                                  children: [
                                    const Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.fitness_center,
                                              color: Colors.black,
                                            ),
                                            SizedBox(width: 3),
                                            Text(
                                              '51 kg',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Weight',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (index != 2)
                                      const VerticalDivider(
                                        color: Colors.black,
                                        thickness: 1,
                                        width: 30,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Description section
                          const Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's.",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),

                          // Base stats section
                          const Text(
                            'Base Stats',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Base stats details
                          Column(
                            children: List.generate(
                              5,
                              (index) => Column(
                                children: [
                                  IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'HP',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.green,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        const VerticalDivider(
                                          color: Colors.black,
                                          thickness: 1,
                                          width: 18,
                                        ),
                                        const Text(
                                          '046',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Container(
                                          width: 250,
                                          height: 13,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Positioned(
                  left: 24,
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Hero(
                      tag: '${widget.index}',
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          body: pokemonProvider.isLoading
              ? Center(
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Lottie.asset(
                        'assets/lottie/Animation - 1729581357918.json'),
                  ),
                )
              : SingleChildScrollView(
                  child: Stack(
                    children: [
                      //stack 1
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 35),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                            ),
                            child: Stack(
                              children: [
                                //stack 1
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Opacity(
                                      opacity: 0.1,
                                      child: SizedBox(
                                        width: width * 0.7,
                                        height: height * 0.3,
                                        child: Image.asset(
                                          'assets/images/PngItem_202138.png',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //stack 2
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const BackButton(
                                          color: Colors.white,
                                        ),
                                        Text(
                                          widget.speciesName.toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 23,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        //index
                                        const Text(
                                          '#1',
                                          style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //abilities
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 80,
                              left: 12,
                              right: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      pokemonProvider.pokemonSpeciesDetails
                                              ?.types?.length ??
                                          0,
                                      (index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Container(
                                            color: Colors.green,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 12,
                                            ),
                                            child: Text(
                                              pokemonProvider
                                                      .pokemonSpeciesDetails
                                                      ?.types?[index]
                                                      .type
                                                      ?.name ??
                                                  "",
                                              style: const TextStyle(
                                                fontSize: 17,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //about title
                                const Text(
                                  'About',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                //physical appearance
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                      physicalApperance.length, (index) {
                                    return IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  // Icon(
                                                  //   Icons.fitness_center,
                                                  //   color: Colors.black,
                                                  // ),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    physicalApperance[index][1],
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                physicalApperance[index][0],
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      255, 102, 102, 102),
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          index == 2
                                              ? Container()
                                              : const VerticalDivider(
                                                  color: Colors.black,
                                                  thickness: 1,
                                                  width: 30,
                                                )
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                //description
                                Container(
                                  height: 100,
                                  padding: const EdgeInsetsDirectional.all(8),
                                  child: Text(
                                    pokemonProvider
                                            .pokemonSpeciesDetailsTwo
                                            ?.flavorTextEntries?[8]
                                            .flavorText ??
                                        "",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                //Base stats
                                const Text(
                                  'Base Stats',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                //Base stats details
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: List.generate(
                                            pokemonProvider
                                                    .pokemonSpeciesDetails
                                                    ?.stats
                                                    ?.length ??
                                                0, (index) {
                                          double percentValue = (pokemonProvider
                                                      .pokemonSpeciesDetails
                                                      ?.stats?[index]
                                                      .baseStat ??
                                                  0) /
                                              100;
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              IntrinsicHeight(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      statsDummy[index],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                    ),
                                                    const VerticalDivider(
                                                      color: Colors.black,
                                                      thickness: 1,
                                                      width: 18,
                                                    ),
                                                    Text(
                                                      pokemonProvider
                                                              .pokemonSpeciesDetails
                                                              ?.stats?[index]
                                                              .baseStat
                                                              .toString() ??
                                                          "",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    LinearPercentIndicator(
                                                      animation: true,
                                                      barRadius:
                                                          const Radius.circular(
                                                              30),
                                                      width: width * 0.7,
                                                      lineHeight: 14.0,
                                                      percent: percentValue
                                                          .clamp(0.0, 1.0),
                                                      backgroundColor:
                                                          Colors.grey,
                                                      progressColor:
                                                          Colors.green,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      //stack 2
                      Positioned(
                        top: 70,
                        left: 58,
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: Hero(
                            tag: '${widget.index}',
                            child: Image.network(
                              widget.image,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        );
      }
    });
  }
}
