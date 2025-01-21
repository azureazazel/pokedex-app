class PokemonCard {
  final String name;
  final String type;
  final String rarity;

  PokemonCard({
    required this.name,
    required this.type,
    required this.rarity,
  });

  // Factory method to parse JSON and handle null values
  factory PokemonCard.fromJson(Map<String, dynamic> json) {
    return PokemonCard(
      name: json['name'] ?? 'Unknown Name',          // Default to 'Unknown Name' if null
      type: json['types'] ?? 'Unknown Type',         // Default to 'Unknown Type' if null
      rarity: json['rarity'] ?? 'Unknown Rarity',    // Default to 'Unknown Rarity' if null
    );
  }
}
