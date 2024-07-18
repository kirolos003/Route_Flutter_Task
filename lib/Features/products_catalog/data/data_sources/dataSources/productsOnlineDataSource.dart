import 'package:flutter_route_task/Features/products_catalog/data/dataSourceContarcts/products_data_source_contract.dart';
import 'package:flutter_route_task/Features/products_catalog/data/data_sources/remote/api_manager.dart';
import 'package:flutter_route_task/Features/products_catalog/data/models/Products.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsDataSourceContract)
class ProductsOnlineDataSource extends ProductsDataSourceContract {
  final ApiManager apiManager;

  @factoryMethod
  ProductsOnlineDataSource(this.apiManager);

  @override
  Future<List<Products>?> getProducts() async {
    var response = await apiManager.getProducts();
    return response.products;
  }
}
