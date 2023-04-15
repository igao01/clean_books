import 'package:clean_books/app/modules/home/domain/usecases/get_book.dart';
import 'package:clean_books/app/modules/home/domain/usecases/get_book_by_search.dart';
import 'package:clean_books/app/modules/home/presenter/provider/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BookProviderImp(
            Modular.get<GetBook>(),
            Modular.get<GetBookBySearch>(),
          ),
        ),
      ],
      child: ModularApp(module: AppModule(), child: const AppWidget()),
    ),
  );
}
