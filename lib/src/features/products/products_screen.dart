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
            child: switch (state) {
              ProductsLoading() => const CircularProgressIndicator(),
              ProductsLoaded() => _buildListView(context, state),
            },
          );
        },
      ),
    );
  }

  Widget _buildListView(BuildContext context, ProductsLoaded state) {
    return ListView.builder(
      itemCount: state.totalProducts,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: CachedNetworkImage(
              imageUrl: state.products[index].thumbnail,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(state.products[index].title),
          subtitle: Text(
            state.products[index].description,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        );
      },
    );
  }
}
