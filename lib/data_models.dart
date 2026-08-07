import 'package:cloud_firestore/cloud_firestore.dart';

class Exercise {
  final String id;
  final String name;
  final String targetMuscle;
  final String muscleImageUrl;
  final String description;
  final String repsAndSets;

  const Exercise({
    required this.id,
    required this.name,
    required this.targetMuscle,
    required this.muscleImageUrl,
    required this.description,
    required this.repsAndSets,
  });

  factory Exercise.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return Exercise(
      id: doc.id,
      name: data['name'] ?? '',
      targetMuscle: data['targetMuscle'] ?? '',
      muscleImageUrl: data['muscleImageUrl'] ?? '',
      description: data['description'] ?? '',
      repsAndSets: data['repsAndSets'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'targetMuscle': targetMuscle,
      'muscleImageUrl': muscleImageUrl,
      'description': description,
      'repsAndSets': repsAndSets,
    };
  }
}

class Kata {
  final String id;
  final String name;
  final String meaning;
  final List<Exercise> exercises;

  const Kata({
    required this.id,
    required this.name,
    required this.meaning,
    this.exercises = const [],
  });

  factory Kata.fromFirestore(
    DocumentSnapshot doc, {
    List<Exercise> exercises = const [],
  }) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return Kata(
      id: doc.id,
      name: data['name'] ?? '',
      meaning: data['meaning'] ?? '',
      exercises: exercises,
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'meaning': meaning};
  }
}

class KarateStyle {
  final String id;
  final String name;
  final String kanji;
  final String description;
  final String imageUrl;
  final List<Kata> katas;

  const KarateStyle({
    required this.id,
    required this.name,
    required this.kanji,
    required this.description,
    required this.imageUrl,
    this.katas = const [],
  });

  factory KarateStyle.fromFirestore(
    DocumentSnapshot doc, {
    List<Kata> katas = const [],
  }) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return KarateStyle(
      id: doc.id,
      name: data['name'] ?? '',
      kanji: data['kanji'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      katas: katas,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'kanji': kanji,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
