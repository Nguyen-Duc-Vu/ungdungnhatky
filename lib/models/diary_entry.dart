import 'package:hive/hive.dart';

part 'diary_entry.g.dart';

@HiveType(typeId: 0)
class DiaryEntry extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String content;

  @HiveField(3)
  final String mood;

  @HiveField(4)
  final DateTime date;

  @HiveField(5)
  bool isFavorite;

  @HiveField(6)
  String? imagePath; // ← Thêm dòng này

  DiaryEntry({
    required this.id,
    required this.title,
    required this.content,
    required this.mood,
    required this.date,
    this.isFavorite = false,
    this.imagePath, // ← Thêm dòng này
  });
}