import 'package:flutter/material.dart';
import 'package:onlineshopping/Ui%20Pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        final prefrence = await SharedPreferences.getInstance();
      await  prefrence.clear();
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LoginPage()));
      },
      child: Icon(Icons.logout),),
      backgroundColor: Colors.grey,
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints viewPortConstraints){
        return SingleChildScrollView(child: ConstrainedBox(constraints: BoxConstraints(minHeight: viewPortConstraints.maxHeight),
        child: Column(
          children: const [
Align(
    alignment: Alignment.bottomCenter,
    child: Text("product page"))
          ],
        ),
        ),);
      }),
    );
  }
}
