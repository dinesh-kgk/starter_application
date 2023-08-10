import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_application/src/cubits/products/products_state.dart';
import 'package:starter_application/src/services/products/products_service.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsLoading());
  final _productsService = ProductsService.create();

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final productsResponse = await _productsService.getProducts();

    emit(
      ProductsLoaded(
        productsResponse.body!.products,
        productsResponse.body!.limit,
      ),
    );
  }
}
