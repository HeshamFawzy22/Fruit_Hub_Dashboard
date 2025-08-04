part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductCubitInitial extends AddProductState {}

final class AddProductCubitLoading extends AddProductState {}

final class AddProductCubitError extends AddProductState {
  final String message;
  AddProductCubitError({required this.message});
}

final class AddProductCubitSuccess extends AddProductState {
  final String message;
  AddProductCubitSuccess({required this.message});
}
