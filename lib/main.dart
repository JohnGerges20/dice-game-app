
import 'package:flutter/material.dart';
import 'dice.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int dice1 = 1;
  int dice2 = 1;
  int total = 2;

  String imagePath = 'assets/sad.png';

  void rollDice() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;
      total = dice1 + dice2;

      imagePath =
      total >= 10 ? 'assets/happy.png' : 'assets/sad.png';
    });
  }

  void resetDice() {
    setState(() {
      dice1 = 1;
      dice2 = 1;
      total = 2;
      imagePath = 'assets/sad.png';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Game'),
        centerTitle: true,
        leading: const Icon(Icons.casino),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text(
              'Total: $total',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            Column(
              children: [
                Image.asset(
                  imagePath,
                  width: 140,
                  height: 140,
                  fit: BoxFit.contain,
                ),
                Text(
                  total >= 10 ? 'You Win!' : 'You Lose!',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dice(value: dice1),
                Dice(value: dice2),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: rollDice,
                    child: const Text('Roll Dice'),
                  ),

                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: resetDice,
                    child: const Text('Reset'),
                  ),

                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
