import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_application/src/cubits/products/products_cubit.dart';
import 'package:starter_application/src/cubits/products/products_state.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return Center(
            child: RepaintBoundary(
              child: switch (state) {
                ProductsLoading() => const CircularProgressIndicator(),
                ProductsLoaded() => _buildListView(context, state),
                ProductsError() =>
                  Text("Error ${state.statusCode}: ${state.message}"),
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () => BlocProvider.of<ProductsCubit>(context).getProducts(),
      ),
    );
  }

  Widget _buildListView(BuildContext context, ProductsLoaded state) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.totalProducts,
      itemBuilder: (context, index) {
        final product = state.products[index];
        return ListTile(
          leading: CircleAvatar(
            child: CachedNetworkImage(
              imageUrl: product.thumbnail,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(product.title),
          subtitle: Text(
            product.description,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        );
      },
    );
  }
}
