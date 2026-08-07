import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karate_training_guide/main_screen.dart';

// ============================================================================
// GLOBAL FIREBASE API KEYS & CONFIGURATION
// Replace placeholders with your Firebase credentials when ready.
// ============================================================================
const String firebaseApiKey = 'YOUR_FIREBASE_API_KEY_HERE';
const String firebaseAppId = 'YOUR_FIREBASE_APP_ID_HERE';
const String firebaseMessagingSenderId = 'YOUR_MESSAGING_SENDER_ID_HERE';
const String firebaseProjectId = 'YOUR_PROJECT_ID_HERE';
const String firebaseStorageBucket = 'YOUR_STORAGE_BUCKET_HERE';

/// Helper boolean to check if user configured valid credentials
bool get isFirebaseConfigured =>
    firebaseApiKey != 'YOUR_FIREBASE_API_KEY_HERE' &&
    firebaseProjectId != 'YOUR_PROJECT_ID_HERE';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase if credentials are provided
  if (isFirebaseConfigured) {
    try {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: firebaseApiKey,
          appId: firebaseAppId,
          messagingSenderId: firebaseMessagingSenderId,
          projectId: firebaseProjectId,
          storageBucket: firebaseStorageBucket,
        ),
      );
    } catch (e) {
      debugPrint("Firebase initialization failed: $e");
    }
  }

  runApp(const KarateExerciseApp());
}
