import 'package:flutter/material.dart';

void main() {
  runApp(DigitalPetApp());
}

class DigitalPetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Pet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PetListScreen(),
    );
  }
}

class PetListScreen extends StatelessWidget {
  final List<Map<String, String>> pets = [
    {"name": "Buddy", "type": "Dog", "description": "Loyal and friendly."},
    {"name": "Whiskers", "type": "Cat", "description": "Loves to nap all day."},
    {"name": "Nibbles", "type": "Rabbit", "description": "Eats a lot of carrots!"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Digital Pets")),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pets[index]['name']!),
            subtitle: Text(pets[index]['type']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PetDetailScreen(pet: pets[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PetDetailScreen extends StatelessWidget {
  final Map<String, String> pet;

  PetDetailScreen({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pet['name']!)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Type: ${pet['type']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Description: ${pet['description']}", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
