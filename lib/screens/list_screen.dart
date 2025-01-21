import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/pokemon_card.dart';
import 'add_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  List<PokemonCard> pokemonCards = [];

  @override
  void initState() {
    super.initState();
    _loadPokemonCards();
  }

  // Load Pokémon cards from SharedPreferences or assets
  void _loadPokemonCards() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? storedData = prefs.getString('pokemon_cards');
      if (storedData != null) {
        print('Loading Pokémon cards from SharedPreferences...');
        List<dynamic> jsonList = jsonDecode(storedData);
        setState(() {
          pokemonCards = jsonList.map((json) => PokemonCard.fromJson(json)).toList();
        });
      } else {
        print('Loading Pokémon cards from assets...');
        String data = await DefaultAssetBundle.of(context).loadString('assets/pokemon_cards.json');
        List<dynamic> jsonList = jsonDecode(data);
        setState(() {
          pokemonCards = jsonList.map((json) => PokemonCard.fromJson(json)).toList();
        });
      }
      print('Loaded ${pokemonCards.length} Pokémon cards.');
    } catch (e) {
      print('Error loading Pokémon cards: $e');
    }
  }

  // Add new Pokémon card
  void addPokemonCard(PokemonCard newCard) async {
    setState(() {
      pokemonCards.add(newCard);
    });

    final prefs = await SharedPreferences.getInstance();
    final String jsonString = jsonEncode(pokemonCards.map((card) => {
          'name': card.name,
          'types': card.type,
          'rarity': card.rarity
        }).toList());

    await prefs.setString('pokemon_cards', jsonString);
    print('Saved ${pokemonCards.length} Pokémon cards to SharedPreferences.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex: My Pokémon Collection'),
      ),
      body: Stack(
        children: [
          Container(color: Colors.black,),
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pokeball_background.png'), // Path to your Pokéball background image
                fit: BoxFit.cover, // Ensures the image covers the screen
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.6), // Slight white overlay for better readability
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          // Main content
          pokemonCards.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/pokeball-png-45330.png',
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'No Pokémon cards found.\nAdd some to get started!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: pokemonCards.length,
                  itemBuilder: (context, index) {
                    final card = pokemonCards[index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Text(
                          card.name,
                          style: TextStyle(
                            fontFamily: 'Pokemon', // Pokémon font for title
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.end, // Align to right
                          children: [
                            Text(
                              'Type: ${card.type}',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black, // Default font for description
                              ),
                            ),
                            Text(
                              'Rarity: ${card.rarity}',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black, // Default font for description
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newCard = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
          if (newCard != null) {
            addPokemonCard(newCard);
          }
        },
        backgroundColor: Colors.red.withOpacity(0.8),
        child: Icon(Icons.add),
      ),
    );
  }
}
