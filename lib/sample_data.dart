import 'package:karate_training_guide/data_models.dart';

final List<KarateStyle> sampleKarateStylesData = [
  KarateStyle(
    id: 'gojuryu',
    name: 'Goju-ryu',
    kanji: '剛柔流',
    description: 'Hard-Soft style focused on dynamic tension & breathing.',
    imageUrl:
        'https://images.unsplash.com/photo-1555597673-b21d5c935865?auto=format&fit=crop&w=600&q=80',
    katas: [
      Kata(
        id: 'sanchin',
        name: 'Sanchin',
        meaning: 'Three Battles (Mind, Body, Spirit)',
        exercises: [
          Exercise(
            id: 'ex1',
            name: 'Sanchin-Dachi Tension Breathing',
            targetMuscle: 'Core & Abdominals',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=300&q=80',
            description:
                'Assume root stance, tighten all core muscles, and practice deep ibuki abdominal breathing.',
            repsAndSets: '3 Sets x 45 Sec Hold',
          ),
          Exercise(
            id: 'ex2',
            name: 'Double Choku-Zuki Power Thrusts',
            targetMuscle: 'Shoulders & Deltoids',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?auto=format&fit=crop&w=300&q=80',
            description:
                'Isometric punching holding light weights to build shoulder stability and thrust power.',
            repsAndSets: '4 Sets x 15 Reps',
          ),
        ],
      ),
      Kata(
        id: 'seiyunchin',
        name: 'Seiyunchin',
        meaning: 'Control and Pull',
        exercises: [
          Exercise(
            id: 'ex3',
            name: 'Shiko-Dachi Deep Squat Hold',
            targetMuscle: 'Quadriceps & Glutes',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1434596922112-19c563067271?auto=format&fit=crop&w=300&q=80',
            description:
                'Lower hip in horse stance with knees pushed outward. Strengthens lower body endurance.',
            repsAndSets: '3 Sets x 60 Sec Hold',
          ),
          Exercise(
            id: 'ex4',
            name: 'Mawashi-Uke Wrist & Forearm Locks',
            targetMuscle: 'Forearms & Flexors',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=300&q=80',
            description:
                'Dynamic circular block wrist rotations against resistance band tension.',
            repsAndSets: '3 Sets x 20 Reps',
          ),
        ],
      ),
    ],
  ),
  KarateStyle(
    id: 'uechiryu',
    name: 'Uechi-ryu',
    kanji: '上地流',
    description: 'Pangai-noon rooted style with body conditioning.',
    imageUrl:
        'https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&w=600&q=80',
    katas: [
      Kata(
        id: 'kanshiwa',
        name: 'Kanshiwa',
        meaning: 'Combination of Kanbun & Shu Shiwa',
        exercises: [
          Exercise(
            id: 'ex5',
            name: 'Shomen-Geri Snap Kicks',
            targetMuscle: 'Hip Flexors & Legs',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&w=300&q=80',
            description:
                'Explosive front toe kicks to strengthen hip flexors and improve kick acceleration.',
            repsAndSets: '4 Sets x 12 Reps / Leg',
          ),
          Exercise(
            id: 'ex6',
            name: 'Nukite Open-Palm Push-Ups',
            targetMuscle: 'Chest & Finger Flexors',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=300&q=80',
            description:
                'Push-ups performed on open hands and fingertips to condition spear-hand strikes.',
            repsAndSets: '3 Sets x 10 Reps',
          ),
        ],
      ),
      Kata(
        id: 'seichin',
        name: 'Seichin',
        meaning: '10 Points / Dragon Strike',
        exercises: [
          Exercise(
            id: 'ex7',
            name: 'Hiji-Ate Upper Back Pulldowns',
            targetMuscle: 'Upper Back & Lats',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1605296867304-46d5465a13f1?auto=format&fit=crop&w=300&q=80',
            description:
                'Simulated elbow strikes using resistance cables to build back power and latch speed.',
            repsAndSets: '4 Sets x 15 Reps',
          ),
          Exercise(
            id: 'ex8',
            name: 'Toe & Calf Stance Elevators',
            targetMuscle: 'Calves & Ankles',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&w=300&q=80',
            description:
                'Raise heels off the ground in stance position to increase balance and ankle strength.',
            repsAndSets: '3 Sets x 25 Reps',
          ),
        ],
      ),
    ],
  ),
  KarateStyle(
    id: 'shotokan',
    name: 'Shotokan',
    kanji: '松濤館',
    description: 'Long-range linear techniques with dynamic power.',
    imageUrl:
        'https://images.unsplash.com/photo-1508215885820-4585e56135c8?auto=format&fit=crop&w=600&q=80',
    katas: [
      Kata(
        id: 'heian_shodan',
        name: 'Heian Shodan',
        meaning: 'Peaceful Mind - Level 1',
        exercises: [
          Exercise(
            id: 'ex9',
            name: 'Zenkutsu-Dachi Explosive Lunges',
            targetMuscle: 'Quadriceps & Hamstrings',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1434596922112-19c563067271?auto=format&fit=crop&w=300&q=80',
            description:
                'Long forward lunge shifts to build deep stance mobility and forward drive force.',
            repsAndSets: '3 Sets x 12 Reps',
          ),
          Exercise(
            id: 'ex10',
            name: 'Gedan Barai Cable Extensions',
            targetMuscle: 'Triceps & Lower Lats',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?auto=format&fit=crop&w=300&q=80',
            description:
                'Downward blocking motion with cable pulleys to reinforce blocking structure.',
            repsAndSets: '3 Sets x 15 Reps',
          ),
        ],
      ),
      Kata(
        id: 'kanku_dai',
        name: 'Kanku Dai',
        meaning: 'To View The Sky',
        exercises: [
          Exercise(
            id: 'ex11',
            name: 'Tobi-Geri Jump Plyometrics',
            targetMuscle: 'Calves & Leg Explosiveness',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&w=300&q=80',
            description:
                'Explosive tuck jumps simulating jump kicks for height and landing stability.',
            repsAndSets: '4 Sets x 8 Reps',
          ),
          Exercise(
            id: 'ex12',
            name: 'Age-Uke Overhead Dumbbell Press',
            targetMuscle: 'Shoulders & Upper Chest',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?auto=format&fit=crop&w=300&q=80',
            description:
                'Overhead diagonal dumbbell presses mimicking high rising blocks.',
            repsAndSets: '3 Sets x 12 Reps',
          ),
        ],
      ),
    ],
  ),
  KarateStyle(
    id: 'shitoryu',
    name: 'Shito-ryu',
    kanji: '糸東流',
    description: 'Blends speed, fluid stance changes & intricate kata.',
    imageUrl:
        'https://images.unsplash.com/photo-1549719386-74dfcbf7dbed?auto=format&fit=crop&w=600&q=80',
    katas: [
      Kata(
        id: 'bassai_dai',
        name: 'Bassai Dai',
        meaning: 'To Penetrate a Fortress',
        exercises: [
          Exercise(
            id: 'ex13',
            name: 'Hip Rotation Oblique Twists',
            targetMuscle: 'Obliques & Core Rotators',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=300&q=80',
            description:
                'Rotational medicine ball twists to sharpen sudden hip snap power.',
            repsAndSets: '3 Sets x 20 Reps',
          ),
          Exercise(
            id: 'ex14',
            name: 'Neko-Ashi Balance Static Holds',
            targetMuscle: 'Calves & Ankles',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1517838277536-f5f99be501cd?auto=format&fit=crop&w=300&q=80',
            description:
                'Cat stance balance drills placing 90% weight on rear leg for stamina.',
            repsAndSets: '3 Sets x 45 Sec Hold',
          ),
        ],
      ),
      Kata(
        id: 'annanko',
        name: 'Annanko',
        meaning: 'Peace From The South',
        exercises: [
          Exercise(
            id: 'ex15',
            name: 'Gyaku-Zuki Core Rotational Punch',
            targetMuscle: 'Abs & Rotators',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=300&q=80',
            description:
                'Reverse punch drills with resistance band anchored behind you.',
            repsAndSets: '4 Sets x 15 Reps',
          ),
          Exercise(
            id: 'ex16',
            name: 'Shuto-Uke Bicep & Forearm Iso Pulls',
            targetMuscle: 'Forearms & Biceps',
            muscleImageUrl:
                'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=300&q=80',
            description:
                'Isometric knife-hand holding against band tension to build forearm block density.',
            repsAndSets: '3 Sets x 12 Reps',
          ),
        ],
      ),
    ],
  ),
];
