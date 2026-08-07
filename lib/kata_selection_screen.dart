import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:karate_training_guide/data_models.dart';
import 'package:karate_training_guide/exercise_screen.dart';
import 'package:karate_training_guide/main.dart';

class KataSelectionScreen extends StatelessWidget {
  final KarateStyle style;

  const KataSelectionScreen({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${style.name} Katas')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                style.description,
                style: TextStyle(fontSize: 14, color: Colors.grey[400]),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: !isFirebaseConfigured
                  ? _buildGrid(style.katas, context)
                  : StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('styles')
                          .doc(style.id)
                          .collection('katas')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
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
                          return const Center(
                            child: Text('No Katas found for this style.'),
                          );
                        }

                        final katas = docs
                            .map((doc) => Kata.fromFirestore(doc))
                            .toList();
                        return _buildGrid(katas, context);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(List<Kata> katas, BuildContext context) {
    return GridView.builder(
      itemCount: katas.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final kata = katas[index];
        return KataGridCard(
          kata: kata,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ExerciseListScreen(styleId: style.id, kata: kata),
              ),
            );
          },
        );
      },
    );
  }
}

class KataGridCard extends StatelessWidget {
  final Kata kata;
  final VoidCallback onTap;

  const KataGridCard({super.key, required this.kata, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.2),
                    child: Icon(
                      Icons.fitness_center,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.grey[500],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kata.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    kata.meaning,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[400],
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
