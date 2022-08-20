import 'package:ecommerce_app_gsg/models/category.dart';
import 'package:ecommerce_app_gsg/models/slider_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../provider/firestore_provider.dart';

class UpdateSliderAdminScreen extends StatelessWidget {
  SliderModel slider;

  UpdateSliderAdminScreen(this.slider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update slider',
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'Courgette-Regular',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Consumer<FireStoreProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 130,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  provider.selectedImage == null
                      ? InkWell(
                          onTap: () {
                            provider.selectImage();
                          },
                          child: CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.red,
                            backgroundImage: NetworkImage(slider.imageUrl!),
                          ),
                        )
                      : CircleAvatar(
                          radius: 100,
                          backgroundImage: FileImage(provider.selectedImage!),
                        ),
                  SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          provider.updateSlider(slider);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: KorangeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'update Slider',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Courgette-Regular',
                              fontSize: 25,
                            ),
                          ),
                        )),
                  )
                  // Center(
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       // Provider.of<FireStoreProvider>(context, listen: false)
                  //       //     .insertNewCategory();
                  //     },
                  //     child: Text('home page'),
                  //   ),
                  // ),
                  // Center(
                  //   child: ElevatedButton(
                  //     onPressed: () async {
                  //      XFile? xfile=aw
                  //      ait ImagePicker().pickImage(source: ImageSource.gallery);
                  //      String url=await StorageHelper.storageHelper.uploadImage(File(xfile!.path));
                  //      log(url);
                  //     },
                  //     child: Text('upload image'),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
