import 'package:clean_books/app/modules/home/domain/entities/book.dart';
import 'package:clean_books/app/modules/home/domain/repositories/book_repository.dart';

abstract class GetBookBySearch {
  Future<List<Book>> getBooksBySearch(String search);
}

class GetBookBySearchImp implements GetBookBySearch {
  final BookRepository bookRepository;

  GetBookBySearchImp(this.bookRepository);

  @override
  Future<List<Book>> getBooksBySearch(String search) async {

     return  await bookRepository.getBooksBySearch(search);
  }
}