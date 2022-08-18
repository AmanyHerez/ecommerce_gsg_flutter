import 'package:flutter/material.dart';

import '../models/product.dart';
class ProductCustomerWidget extends StatelessWidget {
  Product product;
  String catId;
  ProductCustomerWidget(this.product,this.catId);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Card(


        child: Column(
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
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),

                  Text(product.name!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
