import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String desc;
  final String date;
  final String id;
  bool? isDone;
  bool? isDeleted;
  bool? isFavourite;
  Task(
      {required this.title,
      required this.desc,
      required this.id,
      required this.date,
      this.isDone,
      this.isDeleted,
      this.isFavourite}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavourite = isFavourite ?? false;
  }

  Task copyWith({
    String? title,
    String? desc,
    String? id,
    String? date,
    bool? isDone,
    bool? isDeleted,
    bool? isFavourite,
  }) =>
      Task(
          title: title ?? this.title,
          desc: desc ?? this.desc,
          id: id ?? this.id,
          date: this.date,
          isDone: isDone ?? this.isDone,
          isDeleted: isDeleted ?? this.isDeleted,
          isFavourite: isFavourite ?? this.isFavourite);

  factory Task.fromMap(Map<String, dynamic> map) => Task(
        title: map["title"],
        desc: map["desc"],
        id: map["id"],
        date: map["date"],
        isDone: map["isDone"],
        isDeleted: map["isDeleted"],
        isFavourite: map["isFavourite"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "desc": desc,
        "id": id,
        "date": date,
        "isDone": isDone,
        "isDeleted": isDeleted,
        "isFavourite": isFavourite
      };

  @override
  List<Object?> get props =>
      [title, desc, id, date, isDone, isDeleted, isFavourite];
}
