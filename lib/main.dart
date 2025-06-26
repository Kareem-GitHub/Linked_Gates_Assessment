import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/product_repository_impl.dart';
import 'presentation/blocs/product_bloc.dart';
import 'presentation/screens/product_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final productRepository = ProductRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => ProductBloc(productRepository)..add(LoadProducts()),
        child: const ProductListScreen(),
      ),
    );
  }
}
