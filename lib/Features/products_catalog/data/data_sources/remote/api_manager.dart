import 'dart:convert';
import 'package:flutter_route_task/Features/products_catalog/data/models/Product.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@singleton
@injectable
class ApiManager {
  static const baseUrl = 'dummyjson.com';

  Future<Product> getProducts() async {
    var url = Uri.https(baseUrl, 'products');
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var productsResponse = Product.fromJson(json);
    return productsResponse;
  }
}
