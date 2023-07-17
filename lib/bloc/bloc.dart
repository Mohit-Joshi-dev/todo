import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/bloc/state.dart';
import 'package:todolist/product.dart';
import 'package:todolist/repo.dart';

class ProductsCubit extends Cubit<ProductState> {
  ProductsCubit() : super(ProductInitialState());

  void getProducts() async {
    emit(ProductLoadingState());

    try {
      final List<Product> products = await Repo().getProducts();

      emit(ProductLoadedState(products: products));
    } catch (e) {
      emit(ProductErrorState(error: e.toString()));
    }
  }
//new function for details

  void getProductDetails(double id) async {
    emit(SingleProductLoadingState());

    try {
      final Product product = await Repo().getSingleProduct(id);
      emit(SingleProductLoadedState(product: product));
    } catch (e) {
      emit(SingleProductErrorState(error: e.toString()));
    }
  }
}
