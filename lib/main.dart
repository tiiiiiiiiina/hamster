import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HamsterGacha()));

class HamsterGacha extends StatefulWidget {
  const HamsterGacha({super.key});

  @override
  State<HamsterGacha> createState() => _HamsterGachaState();
}

class _HamsterGachaState extends State<HamsterGacha> {
  int n = 0, e = 0;
  bool loading = false;
  final emojis = ['🤡', '🎱', '💫', '🎂'];
  final images = [
    'images/funny1.jpg',
    'images/funny2.jpg',
    'images/funny3.jpg',
    'images/funny4.jpg',
    'images/funny5.jpg',
    'images/funny6.jpg',
    'images/funny7.jpg',
    'images/funny8.jpg',
    'images/funny9.jpg',
    'images/funny10.jpg',
    'images/funny11.jpg',
];

  Future<void> gacha() async {
    setState(() => loading = true);
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() => e = (e + 1) % emojis.length);
    }
    setState(() {
      n = Random().nextInt(images.length);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('🤡 Oogiri Gacha')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: loading
            ? Center(
                   child: Text(
                    emojis[e],
                     style: const TextStyle(fontSize: 100),
                  ),
            )
                : Image.network(images[n], fit: BoxFit.cover),
          ),
          const SizedBox(height: 30),
          const Text('🎪', style: TextStyle(fontSize: 72)),
          ElevatedButton(
            onPressed: loading ? null : gacha,
            child: const Text('ガチャを回す！'),
          ),
        ],
      ),
    ),
  );
}
