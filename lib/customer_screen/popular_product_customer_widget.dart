import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class PopularProductCustomerWidget extends StatelessWidget {
  Product product;


  PopularProductCustomerWidget(this.product, );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      //height: 200,
      child: Card(


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(
              //height: 150,
              width: MediaQuery.of(context).size.width,
              child:  CachedNetworkImage(imageUrl:product.image!),
            ),


              Text(product.name!),
              Text("${product.price!} \$"),










                  // Expanded(
                  //   child: ElevatedButton(
                  //       onPressed: () {
                  //         AppRouter.NavigateToWidget(UpdateCategoryScreen(category));
                  //         // على شان اما اروح هناك يعرضاي ال الاسم جوا التكس فيلد
                  //         Provider.of<FireStoreProvider>(context, listen: false)
                  //             .categoryNameController
                  //             .text = category.name!;
                  //       },
                  //       child: Text('update category')),
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  // Expanded(
                  //   child: ElevatedButton(
                  //       onPressed: () {
                  //         Provider.of<FireStoreProvider>(context, listen: false)
                  //             .deleteCategory(category);
                  //       },
                  //       child: Text('delete category')),
                  // )
                ],
              ),

      ),
    );
    //   Column(
    //   mainAxisSize: MainAxisSize.min,
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Container(
    //       //width: 400,
    //       height: 130,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.only(
    //           topRight: Radius.circular(12),
    //           topLeft: Radius.circular(12),
    //         ),
    //         image: DecorationImage(
    //
    //           image: CachedNetworkImage(imageUrl:
    //             product.image!,
    //           ),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     ),
    //     Container(
    //       width: 150,
    //       decoration: const BoxDecoration(
    //         color: Colors.white,
    //         boxShadow: [
    //           BoxShadow(
    //               color: Colors.grey, offset: Offset(1.0, 0.0), blurRadius: 2),
    //           BoxShadow(
    //               color: Colors.grey, offset: Offset(-2.0, 0.0), blurRadius: 5),
    //         ],
    //         borderRadius: BorderRadius.only(
    //           bottomRight: Radius.circular(12),
    //           bottomLeft: Radius.circular(12),
    //         ),
    //       ),
    //       child:
    //           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //         Padding(
    //           padding: const EdgeInsets.symmetric(
    //             horizontal: 8,
    //             vertical: 3,
    //           ),
    //           child: Text(
    //            product.name!,
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 15,
    //             ),
    //           ),
    //         ),
    //       ]),
    //     ),
    //   ],
    // );
  }
}
