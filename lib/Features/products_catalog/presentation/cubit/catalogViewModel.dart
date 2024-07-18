import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_route_task/Features/products_catalog/domain/use_cases/getProductsUseCase.dart';
import 'package:flutter_route_task/Features/products_catalog/presentation/cubit/catalogViewModelStates.dart';
import 'package:flutter_route_task/Features/products_catalog/presentation/pages/catalog_screen.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/shared_components.dart';

@injectable
class CatalogScreenViewModel extends Cubit<CatalogScreenStates> {
  final GetProductsUseCase productsUseCase;

  @factoryMethod
  CatalogScreenViewModel(this.productsUseCase) : super(CatalogScreenInitial()) {
    loadCatalogProducts();
  }

  void loadCatalogProducts() async {
    emit(CatalogScreenLoading());
    try {
      var catalogProducts = await productsUseCase.invoke();
      emit(CatalogScreenSuccess(catalogProducts!));
    } catch (e) {
      emit(CatalogScreenError(e.toString()));
    }
  }

}
