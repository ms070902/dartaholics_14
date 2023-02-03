import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdDetail extends StatefulWidget {
  const AdDetail({super.key, this.string});
  final DocumentSnapshot<Map<String, dynamic>>? string;

  @override
  State<AdDetail> createState() => _AdDetailState();
}

class _AdDetailState extends State<AdDetail> {
  List image = [];
  late List<Widget> imageSlider;
  int _current = 0;

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      image.addAll([
        widget.string!["file_url1"],
        widget.string!["file_url2"],
        widget.string!["file_url3"]
      ]);
    });
    print(image);

    imageSlider = image.map((e) {
      return Container(
        margin: const EdgeInsets.all(10),
        // height: 350,

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        // width: 1500,
        // height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(children: [
            CachedNetworkImage(
              fit: BoxFit.fitHeight,
              width: 1000,
              // height: 300,

              imageUrl: e,
              // fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
            ),
            // Positioned(
            //   right: 0,
            //   child: Container(
            //     height: 25,
            //     width: 65,
            //     color: Colors.blue[900],
            //     child: Center(
            //       child: Text(
            //         "${data["productPricing"]["off"].toString()}% off ",
            //         style: const TextStyle(
            //           fontSize: 14,
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ]),
        ),
      );
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
              width: 400,
              height: 400,
              child: Stack(
                children: [
                  Column(
                    children: [
                      CarouselSlider(
                          items: imageSlider,
                          options: CarouselOptions(
                            autoPlay: false,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: image.map((e) {
                          int index = image.indexOf(e);
                          return Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: Container(
                              width: 8,
                              height: 8,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? const Color.fromRGBO(0, 0, 0, 0.6)
                                      : const Color.fromRGBO(0, 0, 0, 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "${widget.string!["display_name"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${widget.string!["location"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100,
                            height: 20,
                            decoration: BoxDecoration(color: Colors.yellow),
                            child: Text("Hi"),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
