import 'products_data_services.dart';
import 'category_data_services.dart';

class RemoteDatabase {
  final ProductsDataService productsDataService;
  final CategoryDataService categoryDataService;

  RemoteDatabase(this.productsDataService, this.categoryDataService);

  Future<void> getProductsData() => productsDataService.getProductsData();
  Future<void> getCategoriesData() => categoryDataService.getCategoriesData();
}
