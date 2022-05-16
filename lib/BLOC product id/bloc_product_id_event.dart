part of 'bloc_product_id_bloc.dart';

@immutable
abstract class ProductIdEvent {}
class FetchProductId extends ProductIdEvent{
  final String id;
  FetchProductId({ required this.id});
}
