import 'package:flutter_route_task/Features/products_catalog/data/models/Products.dart';

class Product {
  Product({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  Product.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  List<Products>? products;
  num? total;
  num? skip;
  num? limit;
}
