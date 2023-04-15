abstract class BookApi {
  Future<List<dynamic>> getBooks();
  Future<List<dynamic>> getBooksBySearch(String search);
}