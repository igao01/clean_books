import 'package:clean_books/app/modules/home/domain/entities/book.dart';
import 'package:clean_books/app/modules/home/domain/repositories/book_repository.dart';

abstract class GetBook {
  Future<List<Book>> getBooks();
}

class GetBookImp implements GetBook {
  final BookRepository bookRepository;

  GetBookImp(this.bookRepository);

  @override
  Future<List<Book>> getBooks() async {
     return  await bookRepository.getBooks();
  }
} 