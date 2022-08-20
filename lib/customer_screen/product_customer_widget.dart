import 'package:flutter/material.dart';

import '../models/product.dart';
class ProductCustomerWidget extends StatelessWidget {
  Product product;
  String catId;
  ProductCustomerWidget(this.product,this.catId);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                product.image!,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),

                  Text(product.name!),
                  SizedBox(height: 5,),
                  Text("${product.price!} \$"),

                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
