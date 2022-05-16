//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshopping/Model%20Classes/ProductReadModel.dart';
import 'package:onlineshopping/Ui%20Pages/details_page.dart';
import 'package:onlineshopping/Ui%20Pages/login_page.dart';
import 'package:onlineshopping/product%20images/product_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../BLOC product read/bloc_produc_read_bloc.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
late List<ProductReadModel> productModel;
  //late List<ProductReadModel> productReadModel;

  @override
  void initState() {
  BlocProvider.of<ProducReadBloc>(context).add(FetchProductRead());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        final prefrence = await SharedPreferences.getInstance();
      await  prefrence.clear();
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LoginPage()));
      },
      child: Icon(Icons.logout),),
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [

          SliverAppBar(
          pinned: true,

            backgroundColor: Colors.black,
            title: Text("Online Shopping"),
            actions: [Icon(Icons.card_travel)],
            floating: true,
            automaticallyImplyLeading: true,
            primary: true,
            bottom: PreferredSize(

                child: Expanded(
                  child: SizedBox(
              width: MediaQuery.of(context).size.width*.90,
              height: MediaQuery.of(context).size.height*.90,


              child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Search..",
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey[800],
                  ),
              ),
            ),
                ),
              preferredSize: Size.fromHeight(60),
            ),
          ),
          SliverList(delegate:SliverChildListDelegate(
            [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
               BlocBuilder<ProducReadBloc,ProducReadState>(builder: (context, state){
                 if(state is ProducReadLoading){
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 }
                 if(state is ProducReadLoaded){
                   productModel = BlocProvider.of<ProducReadBloc>(context).productReadModel;

                   return

                     GridView.builder(
                         physics: NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

                         itemCount: productModel.length,
                         itemBuilder: (ctx,index){
                       return Stack(

                         children: [
                           Positioned(
                             top:0,
                             bottom: 0,
                             left: 0,
                             right: 0,
                             child: GestureDetector(
                               onTap: (){
                                 Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DetailsPage(
                                     images: productImages[index].toString(),
                                     id: productModel[index].id.toString())));
                               },
                               child: Card(
                                 child: Image.network(productImages[index],fit: BoxFit.fill,),
                               ),
                             ),
                           ),
                           Positioned(
                               bottom: 8,
                               right: 8,
                               child: Text(productModel[index].productName.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),))
                         ],
                       );
                         });

                 }
                 if(state is ProducReadError){
                   return Center(child: Text("something went wrong"),);
                 }
                 return Center(
                   child: Text("state error"),
                 );
               })

                ],
              )
            ]
          ) )
        ],

      
      
      ),
    );
  }
}






//         child: LayoutBuilder(builder: (BuildContext context, BoxConstraints viewPortConstraints){
//           return SingleChildScrollView(child: ConstrainedBox(constraints: BoxConstraints(minHeight: viewPortConstraints.maxHeight),
//           child: Column(
//             children: const [
// Align(
//     alignment: Alignment.bottomCenter,
//     child: Text("product page"))
//             ],
//           ),
//           ),);
//         }),