import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pokedox_application/model/pokemon_details.dart';
import 'package:pokedox_application/model/pokemon_details_two.dart';
import 'package:pokedox_application/model/pokemon_species_model.dart';

class PokemonController with ChangeNotifier {
  bool isLoading = false;
  final dio = Dio();
  PokemonSpeciesModel? pokemonSpeciesModel;
  PokemonSpeciesDetails? pokemonSpeciesDetails;
  PokemonSpeciesDetailsTwo? pokemonSpeciesDetailsTwo;
  List<Result> pokemonList = [];
  final TextEditingController textEditingController = TextEditingController();

//fetch data from api
  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();
    print("Fetching data...");
    try {
      var response = await dio
          .get('https://pokeapi.co/api/v2/pokemon?limit=10000&offset=0');
      print("Response received: ${response.statusCode}");
      if (response.statusCode == 200) {
        var jsonData = response.data;
        print("Data: $jsonData");
        pokemonList = (jsonData['results'] as List).map((item) {
          return Result(name: item['name'], url: item['url']);
        }).toList();
        notifyListeners();
        print("Pokemon data parsed successfully");
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading = false;
      notifyListeners();
      print("Data fetch completed.");
    }
  }

  Future<void> pokemonDetailsApi({required String specieName}) async {
    isLoading = true;
    notifyListeners();
    print("Fetching data...");
    try {
      var response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$specieName');
      print("Response received: ${response.statusCode}");
      if (response.statusCode == 200) {
        var jsonData = response.data;
        pokemonSpeciesDetails = PokemonSpeciesDetails.fromJson(jsonData);
        notifyListeners();
        print("Pokemon data parsed successfully");
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading = false;
      notifyListeners();
      print("Data fetch completed.");
    }
  }

  //pokemon details 2
  Future<void> pokemonDetailsApiTwo({required int id}) async {
    isLoading = true;
    notifyListeners();
    print("Fetching data...");
    try {
      var response =
          await dio.get('https://pokeapi.co/api/v2/pokemon-species/$id');
      print("Response received: ${response.statusCode}");
      if (response.statusCode == 200) {
        var jsonData = response.data;
        pokemonSpeciesDetailsTwo = PokemonSpeciesDetailsTwo.fromJson(jsonData);
        notifyListeners();
        print("Pokemon data parsed successfully");
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading = false;
      notifyListeners();
      print("Data fetch completed.");
    }
  }
}
