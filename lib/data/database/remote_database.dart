import 'package:e_commerce/data/database/product_details_service.dart';
import 'package:e_commerce/data/model/product_details.dart';

import 'products_data_services.dart';
import 'category_data_services.dart';

class RemoteDatabase {
  final ProductsDataService _productsDataService;
  final CategoryDataService _categoryDataService;
  final ProductDetailsService _productDetailsService;

  RemoteDatabase(this._productsDataService, this._categoryDataService,
      this._productDetailsService);

  Future<void> getProductsData() => _productsDataService.getProductsData();
  Future<void> getCategoriesData() => _categoryDataService.getCategoriesData();
  Future<ProductDetails> getProductDetails(int productId) =>
      _productDetailsService.getProductDetails(productId);
}
