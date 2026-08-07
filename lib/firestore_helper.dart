import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:karate_training_guide/main.dart';
import 'package:karate_training_guide/sample_data.dart';

/// Uploads sample data directly to Firestore DB structure
Future<void> seedFirestoreDatabase(BuildContext context) async {
  if (!isFirebaseConfigured) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '⚠️ Please configure your firebaseApiKey & firebaseProjectId first!',
        ),
      ),
    );
    return;
  }

  try {
    final db = FirebaseFirestore.instance;

    for (var style in sampleKarateStylesData) {
      final styleRef = db.collection('styles').doc(style.id);
      await styleRef.set(style.toMap());

      for (var kata in style.katas) {
        final kataRef = styleRef.collection('katas').doc(kata.id);
        await kataRef.set(kata.toMap());

        for (var exercise in kata.exercises) {
          final exRef = kataRef.collection('exercises').doc(exercise.id);
          await exRef.set(exercise.toMap());
        }
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ Successfully seeded Firestore with Sample Data!'),
        backgroundColor: Colors.green,
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('❌ Error seeding Firestore: $e'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
