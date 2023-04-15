import 'package:clean_books/app/modules/home/presenter/provider/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Livros'),
      ),
      body: FutureBuilder(
        future: Provider.of<BookProviderImp>(context, listen: false).getBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          return Consumer<BookProviderImp>(
            builder: (context, bookProvider, _) {
              return ListView.builder(
                itemCount: bookProvider.books.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(bookProvider.books[index].title),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}