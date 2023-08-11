import 'package:starter_application/src/core/error_handler/api_error_handler.dart';
import 'package:starter_application/src/core/error_handler/general_response.dart';
import 'package:starter_application/src/models/products/products_response.dart';
import 'package:starter_application/src/services/products/products.service.dart';

class ProductsRepository with APIErrorHandler {
  final _productsService = ProductsService.create();

  ProductsRepository();

  Future<GeneralResponse<ProductsResponse>> getProducts() async {
    final response = await handleError(_productsService.getProducts);
    return response;
  }
}
