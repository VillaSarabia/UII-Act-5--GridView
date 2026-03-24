import 'package:flutter/material.dart';

void main() {
  runApp(const DeckTCGApp());
}

class DeckTCGApp extends StatelessWidget {
  const DeckTCGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0A285F),
        scaffoldBackgroundColor: const Color(0xFFE3F2FD), // Fondo azul claro
      ),
      home: const StorePage(),
    );
  }
}

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  // LISTA DE 14 ELEMENTOS CON LINKS DIRECTOS DE GITHUB
  final List<Map<String, dynamic>> pokemonCards = const [
    {
      "name": "Charizard GMAX",
      "set": "Darkness Ablaze",
      "stars": 5,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png"
    },
    {
      "name": "Blastoise GX",
      "set": "Unbroken Bonds",
      "stars": 5,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png"
    },
    {
      "name": "Venusaur V",
      "set": "Champions Path",
      "stars": 4,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png"
    },
    {
      "name": "Pikachu VMAX",
      "set": "Vivid Voltage",
      "stars": 5,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"
    },
    {
      "name": "Mewtwo EX",
      "set": "Next Destinies",
      "stars": 5,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png"
    },
    {
      "name": "Umbreon V",
      "set": "Evolving Skies",
      "stars": 5,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/197.png"
    },
    {
      "name": "Rayquaza Alt",
      "set": "Evolving Skies",
      "stars": 5,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/384.png"
    },
    {
      "name": "Gengar VMAX",
      "set": "Fusion Strike",
      "stars": 5,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/94.png"
    },
    {
      "name": "Lugia Legend",
      "set": "SoulSilver",
      "stars": 5,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/249.png"
    },
    {
      "name": "Lucario VSTAR",
      "set": "Crown Zenith",
      "stars": 4,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/448.png"
    },
    {
      "name": "Snorlax Gold",
      "set": "Chilling Reign",
      "stars": 4,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/143.png"
    },
    {
      "name": "Arceus V",
      "set": "Brilliant Stars",
      "stars": 5,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/493.png"
    },
    {
      "name": "Mew Mythic",
      "set": "Celebrations",
      "stars": 5,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/151.png"
    },
    {
      "name": "Dragonite V",
      "set": "Pokemon GO",
      "stars": 4,
      "url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/149.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A285F),
        title: const Text("DECKTCG STORE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        // Configuración de 2 columnas
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68, // Proporción para 7 filas balanceadas
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: pokemonCards.length,
        itemBuilder: (context, index) {
          final card = pokemonCards[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF0075BE), width: 1.5),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Imagen superior desde el Link de GitHub
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      card['url'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // Sección inferior con 3 filas de info
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8FBFF),
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Fila 1: Título
                        Text(
                          card['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0A285F), fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        // Fila 2: Subtítulo
                        Text(
                          card['set'],
                          style: TextStyle(color: Colors.grey[600], fontSize: 11),
                          textAlign: TextAlign.center,
                        ),
                        // Fila 3: Estrellas
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (i) {
                            return Icon(
                              i < card['stars'] ? Icons.star : Icons.star_border,
                              color: const Color(0xFFFFCB05),
                              size: 16,
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}