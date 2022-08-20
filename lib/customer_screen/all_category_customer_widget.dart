import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';

class AllCategoryCustomerWidget extends StatelessWidget {
  Category category;

  AllCategoryCustomerWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return Card(

      child: CachedNetworkImage(
        imageUrl: category.imageUrl!,
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
      ),

      // child: Column(
      //   children: [
      //     Stack(
      //       children:[
      //         SizedBox(
      //           height: 200,
      //           width: MediaQuery.of(context).size.width,
      //           child: Image.network(
      //             category.imageUrl!,
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //         Positioned(
      //           top: 90,
      //             left: 140,
      //             child: Center(child: Text(category.name!,style: TextStyle(color: Colors.white,fontSize: 25,),))),
      //       ]
      //     ),
      //
      //   ],
      // ),
    );
  }
}
