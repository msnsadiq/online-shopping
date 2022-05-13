import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onlineshopping/Api/product%20read%20api/productread.dart';
import 'package:onlineshopping/Model%20Classes/ProductReadModel.dart';

part 'bloc_produc_read_event.dart';
part 'bloc_produc_read_state.dart';

class ProducReadBloc extends Bloc<ProducReadEvent, ProducReadState> {
  ProductRead productRead;
 late List<ProductReadModel> productReadModel;
  ProducReadBloc(this.productRead) : super(ProducReadInitial()) {
    on<ProducReadEvent>((event, emit) async{
      emit(ProducReadLoading());
      try{
        productReadModel = await productRead.getProduct();
        emit(ProducReadLoaded());
      }
      catch(e){
        print(e);
        emit(ProducReadError());
      }
      // TODO: implement event handler
    });
  }
}
