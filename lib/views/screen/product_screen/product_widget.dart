import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../../provider/firestore_provider.dart';
import '../../../router/router.dart';
import 'update_product_screen.dart';
class ProductWidget extends StatelessWidget {
  Product product;
  String catId;
  ProductWidget(this.product,this.catId);
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
                  Spacer(),

                  InkWell(
                    onTap: () {
                      AppRouter.NavigateToWidget(UpdateProductScreen(product,catId));
                      //  // على شان اما اروح هناك يعرضاي ال الاسم جوا التكس فيلد
                      Provider.of<FireStoreProvider>(context, listen: false)
                          .productNameController
                          .text = product.name!
                      ;
                      Provider.of<FireStoreProvider>(context, listen: false)
                          .productdescriptionController
                          .text = product.description!
                      ;
                      Provider.of<FireStoreProvider>(context, listen: false)
                          .productpriceController.text = product.price!.toString() ;
                      ;
                      Provider.of<FireStoreProvider>(context, listen: false)
                          .productquantityController
                          .text = product.quantity!.toString()
                      ;
                    },
                    child: Image.asset('asset/image/edit.png',width: 40,height: 40,),
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  InkWell(
                    onTap: () {
                      Provider.of<FireStoreProvider>(context, listen: false)
                          .deleteProduct(product, catId);
                    },
                    child: Image.asset('asset/image/delete.png',width: 40,height: 40,),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}