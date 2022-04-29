import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints viewPortConstraints){
        return SingleChildScrollView(child: ConstrainedBox(constraints: BoxConstraints(minHeight: viewPortConstraints.maxHeight),
        child: Column(
          children: [

          ],
        ),
        ),);
      }),
    );
  }
}
