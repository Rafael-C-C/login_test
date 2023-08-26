import 'dart:async';

import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  ScrollController scrollController = ScrollController();
  List<String> items = [
    'Juan',
    'Balam',
    'Balam Fermala',
    'Abraham',
    'Jhona',
    'Nail',
    'Fabian',
    'Ivanba',
    'Ivan gordo',
    'Javi single',
    'Karina',
    'Andrik',
    'Haza',
    'Cristian',
    'Jimmy',
    'Quijano',
    'Joel',
    'Roger',
    'Moreno',
    'Mirian',
    'Marlene',
    'Bonesí',
    'El de inglés',
    'Danyael',
  ];

  String selectedLetter = '';
  bool isHighlighted = false;

  @override
  void initState() {
    super.initState();
    items.sort(); // Sort the list alphabetically
  }

  void highlightLetter(String letter) {
    setState(() {
      selectedLetter = letter;
      isHighlighted = true;
    });

    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        isHighlighted = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('10A IGDS Group List'),
      ),
      body: Row(
        children: [
          // Left side: List of items
          Expanded(
            flex: 2,
            child: ListView.builder(
              controller: scrollController,
              itemCount: 26,
              itemBuilder: (context, index) {
                final letter = String.fromCharCode(65 + index);
                final sectionItems =
                    items.where((item) => item.startsWith(letter)).toList();

                if (sectionItems.isEmpty) {
                  return const SizedBox.shrink();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        letter,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    ...sectionItems.map((item) => Card(
                          child: ListTile(
                            title: Text(item),
                          ),
                        ))
                  ],
                );
              },
            ),
          ),
          // Right side: Alphabet
          Container(
            width: 40, // Adjust the width as needed
            color: Colors.grey[300],
            child: ListView.builder(
              itemCount: 26,
              itemBuilder: (context, index) {
                final letter = String.fromCharCode(65 + index);
                return InkWell(
                  onTap: () {
                    // Scroll to the corresponding section
                    int sectionIndex = items.indexWhere(
                        (item) => item.toUpperCase().startsWith(letter));
                    if (sectionIndex != -1) {
                      scrollController.animateTo(
                        sectionIndex *
                            72.0, // Adjust this value according to your item's height
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                    highlightLetter(letter);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      letter,
                      style: TextStyle(
                        fontSize: 15,
                        color: isHighlighted && selectedLetter == letter
                            ? Colors.blue
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
