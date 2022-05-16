import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onlineshopping/Api/product%20id%20api/product_id_api.dart';
import 'package:onlineshopping/Model%20Classes/ProductIdModel.dart';

part 'bloc_product_id_event.dart';
part 'bloc_product_id_state.dart';

class ProductIdBloc extends Bloc<ProductIdEvent, ProductIdState> {
  ApiProductId apiProductId;
  late  List<ProductIdModel> productIdModel;
  ProductIdBloc(this.apiProductId) : super(ProductIdInitial()) {
    on<FetchProductId>((event, emit)async {
      emit(ProductIdLoading());
      try{
        productIdModel = await apiProductId.getProductId(id: event.id);
        emit(ProductIdLoaded());
      }
      catch(e){
        emit(ProductIdError());
      }
      // TODO: implement event handler
    });
  }
}
