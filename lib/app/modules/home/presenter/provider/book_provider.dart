import 'package:clean_books/app/modules/home/domain/usecases/get_book.dart';
import 'package:clean_books/app/modules/home/domain/usecases/get_book_by_search.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/book.dart';

abstract class BookProvider {
  Future<void> getBooks();
  Future<void> getBooksBySearch(String search);
}

class BookProviderImp with ChangeNotifier implements BookProvider {
  GetBook getBook;
  GetBookBySearch getBookBySearch;

  BookProviderImp(this.getBook, this.getBookBySearch);

  List<Book> _books = [];

  List<Book> get books => [..._books];

  @override
  Future<void> getBooks() async {
    List<Book> booksList = await getBook.getBooks();

    if (booksList.isNotEmpty) {
      _books = booksList;
      notifyListeners();
    }
  }

  @override
  Future<void> getBooksBySearch(String search) async {
    List<Book> booksList = await getBookBySearch.getBooksBySearch(search);
    if (booksList.isNotEmpty) {
      _books = booksList;
      notifyListeners();
    }
  }
}
