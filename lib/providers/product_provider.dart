import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

// class ProductProvider with ChangeNotifier {
//   final List<Product> _products = List.generate(10, (index) => Product(
//       id: 'p$index',
//       name: 'Product $index',
//       price: (10 + index * 2).toDouble(),
//       imageUrl: 'https://via.placeholder.com/150',
//     ),
//   );
//
//   List<Product> get products => _products;
// }


class ProductProvider with ChangeNotifier {
  final _faker = Faker();

  late final List<Product> _products = List.generate(10,
        (i) => Product(
      id: _faker.guid.guid(),
      name: _faker.food.dish(), // using food here because there is no faker method for drinks
      price: double.parse(_faker.randomGenerator.decimal(min: 5, scale: 200).toStringAsFixed(2)),
      // Using a placeholder image service; could also use faker.image.image()
     // imageUrl: 'https://via.placeholder.com/150?text=${Uri.encodeComponent(_faker.lorem.word())}',
      imageUrl: faker.image.loremPicsum(),
    ),
  );

  List<Product> get products => _products;
}
