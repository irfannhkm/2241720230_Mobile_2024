import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: StrawberryPavlovaScreen(),
  ));
}

class StrawberryPavlovaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Strawberry Pavlova - M. Irfan Nur Hakim',
          style: TextStyle(color: Colors.white), 
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Left Column with text
              Expanded(
                flex: 1, // Set flex to 1 to make it 50%
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Section
                    Text(
                      'Strawberry Pavlova',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),

                    // Description Section
                    Text(
                      'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. '
                      'Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.',
                      style: TextStyle(fontSize: 16.0), 
                    ),
                    SizedBox(height: 16.0),

                    // Ratings Section
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star, color: Colors.red),
                        Icon(Icons.star_half, color: Colors.red),
                        SizedBox(width: 8.0),
                        Text('170 Reviews', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    SizedBox(height: 16.0),

                    // Info Section (Prep Time, Cook Time, Feeds)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InfoTile(
                          icon: Icons.timer,
                          label: 'PREP:',
                          value: '25 min',
                        ),
                        InfoTile(
                          icon: Icons.cookie,
                          label: 'COOK:',
                          value: '1 hr',
                        ),
                        InfoTile(
                          icon: Icons.restaurant,
                          label: 'FEEDS:',
                          value: '4-6',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(width: 16.0), // Add spacing between text and image

              // Right Column with Image
              Expanded(
                flex: 1, // Set flex to 1 to make it 50%
                child: Image.asset(
                  'images/strawberry_pavlova.jpg',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// InfoTile Widget to display each info section (Prep, Cook, Feeds)
class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  InfoTile({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.green),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}