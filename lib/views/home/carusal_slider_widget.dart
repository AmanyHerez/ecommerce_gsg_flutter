import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_gsg/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<SliderModel> data;

  const CarouselWithIndicator({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  late List<Widget> imageSliders;

  //@override
  // void initState() {
  //   imageSliders = widget.data.map((item) => Container(
  //     margin: const EdgeInsets.all(10),
  //     child: ClipRRect(
  //         borderRadius: const BorderRadius.all(Radius.circular(10.0)),
  //         child: Stack(
  //           children: <Widget>[
  //             CachedNetworkImage(
  //               imageUrl: item.imageUrl!,
  //               errorWidget: (context, url, error) => const Icon(Icons.error),
  //               progressIndicatorBuilder: (context, url, downloadProgress) =>
  //                   Shimmer.fromColors(
  //                     highlightColor: Colors.white,
  //                     baseColor: Colors.grey.shade300,
  //                     child: Container(
  //                       decoration: const BoxDecoration(
  //                         color: Colors.grey,
  //                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //                       ),
  //                       child:ClipRRect(
  //                         borderRadius: const BorderRadius.all(Radius.circular(10.0)),
  //                         child: AspectRatio(
  //                           aspectRatio: 16 / 9,
  //                           child: Container(
  //                             color: Colors.grey,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //               fit: BoxFit.cover, width: double.infinity,
  //             ),
  //
  //           ],
  //         )
  //     ),
  //   )).toList();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: widget.data
            .map((item) => Container(
                  margin: const EdgeInsets.all(10),
                  child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: Stack(
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: item.imageUrl!,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    Shimmer.fromColors(
                              highlightColor: Colors.white,
                              baseColor: Colors.grey.shade300,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ],
                      )),
                ))
            .toList(),
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.data.map((url) {
          int index = widget.data.indexOf(url);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
                  ? const Color.fromRGBO(0, 0, 0, 0.9)
                  : const Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
// import 'dart:ffi';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:ecommerce_app_gsg/models/category.dart';
// import 'package:flutter/material.dart';
//
// import 'package:shimmer/shimmer.dart';
//
//
//
// class CarouselWithIndicator extends StatefulWidget {
//   final List<Category> data;
//
//   const CarouselWithIndicator({Key? key, required this.data}) : super(key: key);
//   @override
//   State<StatefulWidget> createState() {
//     return _CarouselWithIndicatorState();
//   }
// }
//
// class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
//   int _current = 0;
//   late List<Widget> imageSliders;
//   @override
//   void initState() {
//     imageSliders = widget.data.map((item) => Container(
//       margin: const EdgeInsets.all(10),
//       child: ClipRRect(
//           borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//           child: Stack(
//             children: <Widget>[
//               CachedNetworkImage(
//                 imageUrl: item.imageUrl!,
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//                 progressIndicatorBuilder: (context, url, downloadProgress) =>
//                     Shimmer.fromColors(
//                       highlightColor: Colors.white,
//                       baseColor: Colors.grey.shade300,
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           color: Colors.grey,
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         ),
//                         child:ClipRRect(
//                           borderRadius: const BorderRadius.all(Radius.circular(10.0)),
//                           child: AspectRatio(
//                             aspectRatio: 16 / 9,
//                             child: Container(
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                 fit: BoxFit.cover, width: double.infinity,
//               ),
//
//             ],
//           )
//       ),
//     )).toList();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         children: [
//           CarouselSlider(
//             items: imageSliders,
//             options: CarouselOptions(
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//                 aspectRatio: 16/9,
//                 viewportFraction: 1,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     _current = index;
//                   });
//                 }
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: widget.data.map((url) {
//               int index = widget.data.indexOf(url);
//               return Container(
//                 width: 8.0,
//                 height: 8.0,
//                 margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: _current == index
//                       ? const Color.fromRGBO(0, 0, 0, 0.9)
//                       : const Color.fromRGBO(0, 0, 0, 0.4),
//                 ),
//               );
//             }).toList(),
//           ),
//         ]
//     );
//   }
// }
