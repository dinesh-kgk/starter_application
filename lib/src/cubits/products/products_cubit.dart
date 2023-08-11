import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_application/src/core/error_handler/general_response.dart';
import 'package:starter_application/src/cubits/products/products_state.dart';
import 'package:starter_application/src/repositories/products/products.repository.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsLoading());
  final _productsRepository = ProductsRepository();

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final productsResponse = await _productsRepository.getProducts();
    if (productsResponse is SuccessResponse) {
      emit(
        ProductsLoaded(
          productsResponse.response!.products,
          productsResponse.response!.limit,
        ),
      );
    } else {
      emit(
        ProductsError(
          productsResponse.statusCode,
          (productsResponse as ErrorResponse).message,
        ),
      );
    }
  }
}
