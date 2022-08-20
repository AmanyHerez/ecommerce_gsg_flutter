import 'package:ecommerce_app_gsg/views/screen/slider_screen/update_slider_admin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/slider_model.dart';
import '../../../provider/firestore_provider.dart';
import '../../../router/router.dart';

class AllSliderAdminWidget extends StatelessWidget {
  SliderModel slider;

  AllSliderAdminWidget(this.slider);

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
                slider.imageUrl!,
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

                  InkWell(
                    onTap: () {
                      AppRouter.NavigateToWidget(UpdateSliderAdminScreen(slider));
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
                          .deleteSlider(slider);
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
