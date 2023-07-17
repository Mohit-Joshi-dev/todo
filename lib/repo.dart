import 'dart:convert';

import 'package:http/http.dart' as api;
import 'package:todolist/product.dart';

String baseUrl = 'https://dummyjson.com';

class Repo {
  Future<List<Product>> getProducts() async {
    var res = await api.get(Uri.parse('$baseUrl/products'));

    var data = jsonDecode(res.body);

    List listOfProducts = data['products'];
    final List<Product> products = [];
    for (var element in listOfProducts) {
      products.add(Product.fromJson(element));
    }

    return products;
  }

  Future<Product> getSingleProduct(double id) async {
    int prodId = id.toInt();
    var res = await api.get(Uri.parse('$baseUrl/products/$prodId'));
    var data = jsonDecode(res.body);
    Product product = Product.fromJson(data);
    print(data);
    return product;
  }
}
