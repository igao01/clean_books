import '../../domain/entities/book.dart';

class BookModel extends Book {
  BookModel(
      {required super.id,
      required super.title,
      required super.authors,
      required super.description,
      required super.categories,
      required super.smallThumbnail});

  factory BookModel.fromJSON(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['volumeInfo']['title'] ?? '',
      authors: json['volumeInfo']['authors'] ?? [],
      description: json['volumeInfo']['description'] ?? '',
      categories: json['volumeInfo']['categories'] ?? [],
      smallThumbnail: json['volumeInfo']['smallThumbnail'] ?? '',
    );
  }
}
