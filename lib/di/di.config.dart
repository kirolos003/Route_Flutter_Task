// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../Features/products_catalog/data/data_sources/dataSources/productsOnlineDataSource.dart'
    as _i5;
import '../Features/products_catalog/data/data_sources/remote/api_manager.dart'
    as _i3;
import '../Features/products_catalog/data/dataSourceContarcts/products_data_source_contract.dart'
    as _i4;
import '../Features/products_catalog/data/repositories/productsRepositoryImp.dart'
    as _i7;
import '../Features/products_catalog/domain/repositories/products_repository.dart'
    as _i6;
import '../Features/products_catalog/domain/use_cases/getProductsUseCase.dart'
    as _i8;
import '../Features/products_catalog/presentation/cubit/catalogViewModel.dart'
    as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.ProductsDataSourceContract>(
        () => _i5.ProductsOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductsRepository>(
        () => _i7.ProductsRepositoryImp(gh<_i4.ProductsDataSourceContract>()));
    gh.factory<_i8.GetProductsUseCase>(
        () => _i8.GetProductsUseCase(gh<_i6.ProductsRepository>()));
    gh.factory<_i9.CatalogScreenViewModel>(
        () => _i9.CatalogScreenViewModel(gh<_i8.GetProductsUseCase>()));
    return this;
  }
}
