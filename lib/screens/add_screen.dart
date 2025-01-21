import 'package:flutter/material.dart';
import '../models/pokemon_card.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _rarityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Pokémon Card'),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pokeball_background.png'), // Path to background image
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.6), // Slight overlay for readability
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _typeController,
                  decoration: InputDecoration(labelText: 'Type'),
                ),
                TextField(
                  controller: _rarityController,
                  decoration: InputDecoration(labelText: 'Rarity'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final name = _nameController.text.trim();
                    final type = _typeController.text.trim();
                    final rarity = _rarityController.text.trim();

                    if (name.isNotEmpty && type.isNotEmpty && rarity.isNotEmpty) {
                      Navigator.pop(
                        context,
                        PokemonCard(name: name, type: type, rarity: rarity),
                      );
                    }
                  },
                  child: Text('Add Card'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _rarityController.dispose();
    super.dispose();
  }
}
