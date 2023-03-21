import 'package:e_commerce/data/database/product_details_service.dart';

import '../model/product_model.dart';
import 'products_data_services.dart';
import 'category_data_services.dart';

abstract class BaseRemoteDatabase {
  Future<void> getProductsData();
  Future<void> getCategoriesData();
  Future<ProductModel> getProductDetails(int productId);
}

class RemoteDatabase implements BaseRemoteDatabase {
  final ProductsDataService _productsDataService;
  final CategoryDataService _categoryDataService;
  final ProductDetailsService _productDetailsService;

  RemoteDatabase(this._productsDataService, this._categoryDataService,
      this._productDetailsService);

  @override
  Future<void> getProductsData() => _productsDataService.getProductsData();
  @override
  Future<void> getCategoriesData() => _categoryDataService.getCategoriesData();
  @override
  Future<ProductModel> getProductDetails(int productId) =>
      _productDetailsService.getProductDetails(productId);
}
