import 'package:flutter_route_task/Features/products_catalog/data/models/Products.dart';
import 'package:flutter_route_task/Features/products_catalog/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  final ProductsRepository repository;

  @factoryMethod
  GetProductsUseCase(this.repository);

  Future<List<Products>?> invoke() {
    return repository.getProducts();
  }
}
