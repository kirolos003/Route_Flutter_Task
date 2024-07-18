import 'package:flutter_route_task/Features/products_catalog/data/models/Products.dart';

sealed class CatalogScreenStates {}

class CatalogScreenInitial extends CatalogScreenStates {}

class CatalogScreenLoading extends CatalogScreenStates {}

class CatalogScreenSuccess extends CatalogScreenStates {
  final List<Products> catalogProductsList;

  CatalogScreenSuccess(this.catalogProductsList);
}

class CatalogScreenError extends CatalogScreenStates {
  final String error;

  CatalogScreenError(this.error);
}
