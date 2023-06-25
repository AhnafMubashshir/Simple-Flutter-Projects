import 'package:flutter/material.dart';
import 'package:lists_of_data/quote_card.dart';
import 'quotes.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List <Quote> quotes = [
    Quote(quote: 'Be yourself; Everyone else is ready taken.', author: 'A'),
    Quote(quote: 'I have nothing to declare except my genius.', author: 'B'),
    Quote(quote: 'The truth is rarely pure & never simple.', author: 'C'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Awsome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          delete: () {
            setState(() {
              quotes.remove(quote);
            });
          }
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            quotes.add(Quote(quote: "quote", author: "author"));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}