import 'package:clean_books/app/modules/home/domain/entities/book.dart';
import 'package:clean_books/app/modules/home/infra/models/book_model.dart';

import '../datasources/book_api.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
  Future<List<Book>> getBooksBySearch(String search);
}

class BookRepositoryImp implements BookRepository {
  final BookApi api;

  BookRepositoryImp(this.api);

  @override
  Future<List<Book>> getBooks() async {
    List<Book> books = [];
    List<dynamic> items = [];

    items = await api.getBooks();

    print(' BOOKS TO CONVERT ${items[0].toString()}');

    books = items.map((jsonBook) {
      Book book = BookModel.fromJSON(jsonBook);
      return book;
    }).toList();

    print('CONVERTED BOOKS ${books[0].title.toString()}');

    return books;
  }

  @override
  Future<List<Book>> getBooksBySearch(String search) async {
    List<Book> books = [];
    List<dynamic> items = [];

    items = await api.getBooksBySearch(search);

    print(' BOOKS TO CONVERT ${items[0].toString()}');

    books = items.map((jsonBook) {
      Book book = BookModel.fromJSON(jsonBook);
      return book;
    }).toList();

    print('CONVERTED BOOKS ${books[0].title.toString()}');

    return books;
  }
}
