import 'package:equatable/equatable.dart';

import 'package:todolist/product.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

/// Notifies bloc to increment state.
class ProductInitialState extends ProductState {}

/// Notifies bloc to decrement state.
class ProductLoadingState extends ProductState {}

/// Notifies bloc to decrement state.
class ProductLoadedState extends ProductState {
  final List<Product> products;

  ProductLoadedState({required this.products});

  @override
  List<Object> get props => [
        products,
      ];
}

class ProductErrorState extends ProductState {
  final String error;
  ProductErrorState({
    required this.error,
  });

  @override
  List<Object> get props => [
        error,
      ];
}

class SingleProductInitState extends ProductState {}

class SingleProductLoadingState extends ProductState {}

class SingleProductLoadedState extends ProductState {
  final Product product;

  SingleProductLoadedState({required this.product});
  @override
  List<Object> get props => [
        product,
      ];
}

class SingleProductErrorState extends ProductState {
  final String error;
  SingleProductErrorState({
    required this.error,
  });

  @override
  List<Object> get props => [
        error,
      ];
}
