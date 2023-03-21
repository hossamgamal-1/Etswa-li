import '../../data/model/product_model.dart';
import 'get_categories_list.dart';
import 'get_product_details.dart';
import 'get_products_list.dart';

class UseCases {
  final ProductsDataGetterBaseUseCase _productsDataGetterUseCase;
  final CategoriesDataGetterBaseUseCase _categoriesDataGetterBaseUseCase;
  final ProductDetailsGetterBaseUseCase _productDetailsGetterBaseUseCase;

  UseCases(
      this._productsDataGetterUseCase,
      this._categoriesDataGetterBaseUseCase,
      this._productDetailsGetterBaseUseCase);

  Future<void> getProductsData() =>
      _productsDataGetterUseCase.getProductsData();
  Future<void> getCategoriesData() =>
      _categoriesDataGetterBaseUseCase.getCategoriesData();
  Future<ProductModel> getProductDetails(int productId) =>
      _productDetailsGetterBaseUseCase.getProductDetails(productId);
}
