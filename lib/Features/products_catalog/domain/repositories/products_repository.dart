import 'package:flutter_route_task/Features/products_catalog/data/models/Products.dart';


abstract class ProductsRepository {
  Future<List<Products>?> getProducts();
}
