class PokemonCard {
  final String name;
  final String type;
  final String rarity;

  PokemonCard({
    required this.name,
    required this.type,
    required this.rarity,
  });

  //method to parse JSON and handle null values
  factory PokemonCard.fromJson(Map<String, dynamic> json) {
    return PokemonCard(
      name: json['name'] ?? 'Unknown Name',          
      type: json['types'] ?? 'Unknown Type',         
      rarity: json['rarity'] ?? 'Unknown Rarity',    
    );
  }
}
