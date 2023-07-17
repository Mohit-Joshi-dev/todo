import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/bloc.dart';
import 'package:todolist/bloc/state.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ProductsCubit, ProductState>(
        builder: (context, state) {
          print(state);
          if (state is SingleProductLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SingleProductLoadedState) {
            return Center(
              child: Text(state.product.title),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
