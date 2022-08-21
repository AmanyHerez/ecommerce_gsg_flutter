import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/product.dart';

class DetailsProductWidget extends StatelessWidget {
  Product product;
  String id;
  DetailsProductWidget(this.product,this.id);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Container(
            width: 450,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 219, 225, 230),
              image: DecorationImage(
                  image: NetworkImage(product.image!), fit: BoxFit.cover),
            ),
            // Image.network(product.image,width: 500,height: 350,)
          )),
          // Container(
          //   decoration: const BoxDecoration(
          //     color: Colors.grey,
          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
          //   ),
          //   child: ClipRRect(
          //     borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          //     child: AspectRatio(
          //       aspectRatio: 16 / 12,
          //       child: Image(image: NetworkImage(product.image!))
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  product.name!,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courgette-Regular',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Text("Price:",style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Courgette-Regular',
                    color: KorangeColor,

                  ),),
                  Text(
                  '${product.price!} \$',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Courgette-Regular',
                  ),
                ),],),


                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Text("quantity:",style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Courgette-Regular',
                    color: KorangeColor,

                  ),),
                  Text(
                    '${product.quantity!} ',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Courgette-Regular',


                    ),
                  ),],),

                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Text('Description', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Courgette-Regular',
          ),),
          Text(
            product.description!,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Courgette-Regular',
            ),
          ),
        ],
      ),
    );
  }
}
