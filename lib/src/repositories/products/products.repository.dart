import 'package:starter_application/src/core/error_handler/api_error_handler.dart';
import 'package:starter_application/src/core/error_handler/general_response.dart';
import 'package:starter_application/src/models/products/products_response.dart';
import 'package:starter_application/src/services/products/products.service.dart';

class ProductsRepository with APIErrorHandler {
  ProductsRepository();

  final _productsService = ProductsService();

  Future<GeneralResponse<ProductsResponse>> getProducts() async {
    final generalResponse = await handleError(
      () => _productsService.getProducts(),
    );
    return generalResponse;
  }
}
