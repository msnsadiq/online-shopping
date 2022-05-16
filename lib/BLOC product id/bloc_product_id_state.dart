part of 'bloc_product_id_bloc.dart';

@immutable
abstract class ProductIdState {}

class ProductIdInitial extends ProductIdState {}
class ProductIdLoading extends ProductIdState{}
class ProductIdLoaded extends ProductIdState{}
class ProductIdError extends ProductIdState{}
