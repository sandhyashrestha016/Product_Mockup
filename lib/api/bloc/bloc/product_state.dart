part of 'product_bloc.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductCompletedState extends ProductState {
  final ProductData productData;

  ProductCompletedState({required this.productData});
}

final class ProductErrorState extends ProductState {
  final String message;

  ProductErrorState({required this.message});
}
