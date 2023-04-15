import 'package:clean_books/app/external/datasource/book_api_imp.dart';
import 'package:clean_books/app/modules/home/domain/usecases/get_book_by_search.dart';
import 'package:clean_books/app/modules/home/infra/datasources/book_api.dart';
import 'package:clean_books/app/modules/home/infra/repositories/book_repository_imp.dart';
import 'package:clean_books/app/modules/home/presenter/provider/book_provider.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_routes.dart';
import 'modules/home/domain/usecases/get_book.dart';
import 'modules/home/presenter/pages/home.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => GetBook),
        Bind.factory((i) => GetBookBySearch),
        Bind.factory((i) => BookApi),
        Bind.factory((i) => BookProvider),
        Bind.factory((i) => BookRepositoryImp(i())),
        Bind.factory<GetBook>((i) => GetBookImp(i())),
        Bind.factory<GetBookBySearch>((i) => GetBookBySearchImp(i())),
        Bind.factory<BookApi>((i) => BooksApiImp()),
        Bind.factory<BookProvider>((i) => BookProviderImp(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.home, child: (ctx, args) => const Home()),
      ];
}
