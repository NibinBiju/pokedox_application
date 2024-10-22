import 'package:flutter/material.dart';
import 'package:pokedox_application/constants/colors/colors.dart';
import 'package:pokedox_application/constants/images/image.dart';
import 'package:pokedox_application/controller/pokemon_controller.dart';
import 'package:pokedox_application/view/details_page/details_page.dart';
import 'package:pokedox_application/widgets/custom_container.dart';
import 'package:pokedox_application/widgets/search_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<PokemonController>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pokemonProvider = Provider.of<PokemonController>(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Scaffold(
            backgroundColor: red,
            appBar: AppBar(
              backgroundColor: red,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(pokemonBallPng),
              ),
              title: const Text(
                'Pokèdox',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomSerachField.customSearchField(
                    textEditingController:
                        pokemonProvider.textEditingController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: pokemonProvider.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: red,
                              ),
                            )
                          : GridView.count(
                              childAspectRatio: 19 / 25,
                              crossAxisCount: 4,
                              children: List.generate(
                                pokemonProvider.pokemonList.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  //species container
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsPage(
                                          speciesName: pokemonProvider
                                              .pokemonList[index].name,
                                          index: index,
                                          image:
                                              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
                                        ),
                                      ),
                                    ),
                                    child: CustomSpeciesContainer(
                                      index: index,
                                      speciesName: pokemonProvider
                                          .pokemonList[index].name,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          //mobile veiw
          return Scaffold(
            backgroundColor: red,
            appBar: AppBar(
              backgroundColor: red,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(pokemonBallPng),
              ),
              title: const Text(
                'Pokèdox',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //search bar
                  CustomSerachField.customSearchField(
                    textEditingController:
                        pokemonProvider.textEditingController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Container
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: pokemonProvider.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: red,
                              ),
                            )
                          : GridView.count(
                              childAspectRatio: 19 / 25,
                              crossAxisCount: 2,
                              children: List.generate(
                                pokemonProvider.pokemonList.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  //species container
                                  child: GestureDetector(
                                    onTap: () {
                                      pokemonProvider.pokemonDetailsApi(
                                          specieName: pokemonProvider
                                              .pokemonList[index].name);

                                      pokemonProvider.pokemonDetailsApiTwo(
                                          id: index + 1);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                            speciesName: pokemonProvider
                                                .pokemonList[index].name,
                                            index: index,
                                            image:
                                                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
                                          ),
                                        ),
                                      );
                                    },
                                    child: CustomSpeciesContainer(
                                      index: index,
                                      speciesName: pokemonProvider
                                          .pokemonList[index].name,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
