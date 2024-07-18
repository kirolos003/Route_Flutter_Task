
import 'package:flutter_route_task/Features/products_catalog/data/dataSourceContarcts/products_data_source_contract.dart';
import 'package:flutter_route_task/Features/products_catalog/data/models/Products.dart';
import 'package:flutter_route_task/Features/products_catalog/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : ProductsRepository)
class ProductsRepositoryImp extends ProductsRepository{
  ProductsDataSourceContract dataSource;

  @factoryMethod
  ProductsRepositoryImp(this.dataSource);

  @override
  Future<List<Products>?> getProducts() {
    return dataSource.getProducts();
  } 
}