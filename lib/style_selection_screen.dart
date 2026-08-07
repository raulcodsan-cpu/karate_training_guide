import 'package:flutter/material.dart';
import 'package:karate_training_guide/data_models.dart';
import 'package:karate_training_guide/firestore_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karate_training_guide/kata_selection_screen.dart';
import 'package:karate_training_guide/main.dart';
import 'package:karate_training_guide/sample_data.dart';

class StyleSelectionScreen extends StatelessWidget {
  const StyleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🥋 SELECT KARATE STYLE'),
        actions: [
          IconButton(
            icon: const Icon(Icons.cloud_upload, color: Colors.amber),
            tooltip: 'Seed Firestore with Sample Data',
            onPressed: () => seedFirestoreDatabase(context),
          ),
        ],
      ),
      body: Column(
        children: [
          if (!isFirebaseConfigured)
            Container(
              color: Colors.amber.shade900.withOpacity(0.4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.amber, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Running in Local Sample Data mode. Fill your Firebase Keys at the top of main.dart to connect Firestore.',
                      style: TextStyle(fontSize: 11, color: Colors.amber),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: !isFirebaseConfigured
                  ? _buildGrid(sampleKarateStylesData, context)
                  : StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('styles')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Error loading styles: ${snapshot.error}',
                            ),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final docs = snapshot.data?.docs ?? [];
                        if (docs.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('No Styles found in Firestore.'),
                                const SizedBox(height: 12),
                                ElevatedButton.icon(
                                  onPressed: () =>
                                      seedFirestoreDatabase(context),
                                  icon: const Icon(Icons.cloud_upload),
                                  label: const Text('Seed Sample Data to DB'),
                                ),
                              ],
                            ),
                          );
                        }

                        final styles = docs
                            .map((doc) => KarateStyle.fromFirestore(doc))
                            .toList();
                        return _buildGrid(styles, context);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(List<KarateStyle> styles, BuildContext context) {
    return GridView.builder(
      itemCount: styles.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final style = styles[index];
        return StyleGridCard(
          style: style,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => KataSelectionScreen(style: style),
              ),
            );
          },
        );
      },
    );
  }
}

class StyleGridCard extends StatelessWidget {
  final KarateStyle style;
  final VoidCallback onTap;

  const StyleGridCard({super.key, required this.style, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                style.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[850],
                  child: const Icon(
                    Icons.sports_martial_arts,
                    size: 48,
                    color: Colors.white38,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.85),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        style.kanji,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        style.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tap to explore Katas',
                        style: TextStyle(fontSize: 11, color: Colors.grey[300]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
