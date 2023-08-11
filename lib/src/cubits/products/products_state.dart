import 'package:starter_application/src/models/models.dart';

sealed class ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;
  final int totalProducts;

  ProductsLoaded(this.products, this.totalProducts);
}

class ProductsError extends ProductsState {
  final int statusCode;
  final String message;

  ProductsError(this.statusCode, this.message);
}
