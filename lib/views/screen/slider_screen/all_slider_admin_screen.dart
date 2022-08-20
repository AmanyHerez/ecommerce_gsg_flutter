import 'package:ecommerce_app_gsg/views/screen/product_screen/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../provider/firestore_provider.dart';
import '../../../router/router.dart';
import 'add_new_slider.dart';
import 'all_slider_admin_widget.dart';

class AllSliderAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Slider',
          style: TextStyle(
            fontFamily: 'Courgette-Regular',
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme:IconThemeData(color: Colors.black87) ,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRouter.NavigateToWidget(AddNewSlider());
        },
        child: Icon(Icons.add,color: Colors.white,size: 30,),
        backgroundColor: KorangeColor,


      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Consumer<FireStoreProvider>(
          builder: (context, provider, child) {
            return provider.sliders == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: provider.sliders!.length,
                    itemBuilder: (context, index) {
                      return AllSliderAdminWidget(provider.sliders![index]);
                    },
                  );
          },
        ),
      ),
    );
  }
}
