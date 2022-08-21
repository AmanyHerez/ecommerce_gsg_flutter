import 'package:ecommerce_app_gsg/models/category.dart';
import 'package:ecommerce_app_gsg/provider/firestore_provider.dart';
import 'package:ecommerce_app_gsg/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen/category_screen/update_category_screen.dart';

class CategoryWidget extends StatelessWidget {
  Category category;

  CategoryWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                category.imageUrl!,
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

                  Text(category.name!,style: TextStyle(fontFamily: 'Courgette-Regular',fontSize: 26),),
                  Spacer(),

                  InkWell(
                    onTap: () {
                      AppRouter.NavigateToWidget(UpdateCategoryScreen(category));
                      // على شان اما اروح هناك يعرضاي ال الاسم جوا التكس فيلد
                      Provider.of<FireStoreProvider>(context, listen: false)
                          .categoryNameController
                          .text = category.name!;
                    },
                    child: Image.asset(
                      'asset/image/edit.png',
                      width: 40,
                      height: 40,
                    ),
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  InkWell(
                    onTap: () {
                      Provider.of<FireStoreProvider>(context, listen: false)
                          .deleteCategory(category);
                    },
                    child: Image.asset(
                      'asset/image/delete.png',
                      width: 40,
                      height: 40,
                    ),
                  ),

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
          ],
        ),
      ),
    );
  }
}
