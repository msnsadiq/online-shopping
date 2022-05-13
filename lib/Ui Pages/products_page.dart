//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshopping/Model%20Classes/ProductReadModel.dart';
import 'package:onlineshopping/Ui%20Pages/login_page.dart';
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
                   return SingleChildScrollView(
                       scrollDirection: Axis.vertical,

                         child:Column(
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             ListTile(
                               title: Text(productModel[12].productName.toString(),style: TextStyle(color: Colors.white),),
                               trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,color: Colors.white,)),

                             ),
                             SizedBox(
                               height: 200,
                               child: ListView.builder(
                                 scrollDirection: Axis.horizontal,
                                 itemCount: productModel.length,
                                 itemBuilder: (ctx,index){
                                   return  Card(
                                     elevation: 20,
                                     child:
                                     Image.network('https://picsum.photos/200/300',fit: BoxFit.fill,),
                                   )   ;
                                 },
                               ),
                             ),
                             ListTile(
                               title: Text("Mobiles",style: TextStyle(color: Colors.white),),
                               trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,color: Colors.white,)),

                             ),
                             SizedBox(
                               height: 200,
                               child: ListView.builder(
                                 scrollDirection: Axis.horizontal,
                                 itemCount: 10,
                                 itemBuilder: (ctx,index){
                                   return  Card(
                                     elevation: 20,
                                     child:
                                     Image.network('https://picsum.photos/300/200',fit: BoxFit.fill,),
                                   )   ;
                                 },
                               ),
                             ),

                             ListTile(
                               title: Text("Sports",style: TextStyle(color: Colors.white),),
                               trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,color: Colors.white,)),

                             ),
                             SizedBox(
                               height: 200,
                               child: ListView.builder(
                                 scrollDirection: Axis.horizontal,
                                 itemCount: 10,
                                 itemBuilder: (ctx,index){
                                   return  Card(
                                     elevation: 20,
                                     child:
                                     Image.network('https://picsum.photos/seed/picsum/200/300',fit: BoxFit.fill,),
                                   )   ;
                                 },
                               ),
                             ),
                             ListTile(
                               title: Text("Fashion",style: TextStyle(color: Colors.white),),
                               trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,color: Colors.white,)),

                             ),
                             SizedBox(
                               height: 200,
                               child: ListView.builder(
                                 scrollDirection: Axis.horizontal,
                                 itemCount: 10,
                                 itemBuilder: (ctx,index){
                                   return  Card(
                                     elevation: 20,
                                     child:
                                     Image.network('https://picsum.photos/id/237/200/300',fit: BoxFit.fill,),
                                   )   ;
                                 },
                               ),
                             )
                           ],
                         ) ,


                     );

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