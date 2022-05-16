import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onlineshopping/BLOC%20product%20id/bloc_product_id_bloc.dart';
import 'package:onlineshopping/Model%20Classes/ProductIdModel.dart';

class DetailsPage extends StatefulWidget {
   DetailsPage({Key? key,required this.id, required this.images}) : super(key: key);
final String id;
String images;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late List<ProductIdModel> productIdModel;
  @override
  void initState() {
    BlocProvider.of<ProductIdBloc>(context).add(FetchProductId(id: widget.id));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
bottomNavigationBar: BottomNavigationBar(
    backgroundColor: Colors.black,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
    selectedIconTheme: IconThemeData(color: Colors.white),
    unselectedIconTheme : IconThemeData(color: Colors.white),
   // selectedLabelStyle: TextStyle(backgroundColor: Colors.white),
   // unselectedLabelStyle: TextStyle(backgroundColor: Colors.orange),
    items: [
  BottomNavigationBarItem(icon: Icon(Icons.card_travel),label: "GO TO CART"),
  BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart),label: "BUY NOW"),
]),
      appBar: AppBar(backgroundColor: Colors.black,),
      backgroundColor: Colors.black,
      body: BlocBuilder<ProductIdBloc,ProductIdState>(builder: (context,state){
        if(state is ProductIdLoading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is ProductIdLoaded){
          productIdModel = BlocProvider.of<ProductIdBloc>(context).productIdModel;
          return  Padding(
            padding: EdgeInsets.only(left: 5,right: 5),
            child: Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
//mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*.5
                    ,
                    child: Card(
                      child: Image.network(widget.images,fit: BoxFit.fill,),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 5,),
                    Text(productIdModel[0].productName.toString(),style: TextStyle(fontSize: 20,color: Colors.white),),
                    Text("( ${productIdModel[0].description.toString()} )",style: GoogleFonts.aleo(color: Colors.white),)
                  ],
                ),
               // Text(productIdModel[0].description.toString(),style: GoogleFonts.allerta (color: Colors.white),),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
SizedBox(width: 10,),
                    Icon(Icons.money_off_sharp,color: Colors.white,),
                    Text(productIdModel[0].price.toString(),style: TextStyle(color: Colors.white),),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only( top:8.0,left: 3,right: 3),
                      child: SizedBox(

                        child: Card(
                          color: Colors.black,
                          elevation: 20,
                          child: Text("160 people ordered this in the last 30 days",style: GoogleFonts.alike(color: Colors.white),),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                   Icon(Icons.keyboard_return,color: Colors.white,),
                          Text("7 Days Returns",style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      //VerticalDivider(width: 5,color: Colors.black,thickness: 3,),
                      Column(
                        children: [
                          Icon(Icons.money,color: Colors.white,),
                          Text("Cash On Delivery available",style: TextStyle(color: Colors.white),)
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.add,color: Colors.white,),
                          Text("Plus Product",style: TextStyle(color: Colors.white),)
                        ],
                      )
                    ],
                  ),
                ),

              ],

            ),
          ) ;




        }
        if(state is ProductIdError){
          return Center(
            child:  Text("something went wrong"),
          );
        }
        return Center(
          child:  Text("something went wrong"),
        );
      })



    );
  }
}
