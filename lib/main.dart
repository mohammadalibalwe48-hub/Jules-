import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stat Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const StatTrackerHome(),
    );
  }
}

class StatTrackerHome extends StatefulWidget {
  const StatTrackerHome({super.key});

  @override
  State<StatTrackerHome> createState() => _StatTrackerHomeState();
}

class _StatTrackerHomeState extends State<StatTrackerHome> {
  int _waterGlasses = 0;
  int _pushups = 0;
  int _pagesRead = 0;

  void _incrementWater() {
    setState(() {
      _waterGlasses++;
    });
  }

  void _incrementPushups() {
    setState(() {
      _pushups += 10;
    });
  }

  void _incrementPages() {
    setState(() {
      _pagesRead += 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Daily Stats'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildStatCard(
            'Water',
            '$_waterGlasses Glasses',
            Icons.water_drop,
            Colors.blue,
            _incrementWater,
          ),
          const SizedBox(height: 16),
          _buildStatCard(
            'Pushups',
            '$_pushups',
            Icons.fitness_center,
            Colors.red,
            _incrementPushups,
          ),
          const SizedBox(height: 16),
          _buildStatCard(
            'Reading',
            '$_pagesRead Pages',
            Icons.menu_book,
            Colors.green,
            _incrementPages,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color, VoidCallback onIncrement) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    value,
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle, size: 40),
              color: color,
              onPressed: onIncrement,
            ),
          ],
        ),
      ),
    );
  }
}
