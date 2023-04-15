class Book {
  String id;
  String title;
  List<dynamic> authors;
  String description;
  List<dynamic> categories;
  String smallThumbnail;
  
  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.description,
    required this.categories,
    required this.smallThumbnail,
  });
}
