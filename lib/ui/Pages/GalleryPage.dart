import 'dart:developer';

import 'package:crush/redux/models/GalModel.dart';
import 'package:crush/redux/models/Service.dart';
import 'package:crush/util/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:crush/redux/models/app_state.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:url_launcher/url_launcher.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  // ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) {
        final Map<String, dynamic> args = {
          "gal": store.state.info.gal,
          "index": store.state.selectedService,
        };
        return args;
      },
      builder: (context, args) {
        final bool isLoading = args["isLoading"];
        final List<Gal> gal = args["gal"];
        // final int index = args["index"];

        return Scaffold(
            appBar: AppBar(
              title: Text('Our Work Quality'),
            ),
            body: Container(
              child: PhotoViewGallery.builder(
                backgroundDecoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.5)
                ),
                scrollDirection: Axis.vertical,
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    // tightMode: false,
                    imageProvider: NetworkImage(gal[index].url),
                    initialScale: PhotoViewComputedScale.contained,
                    heroAttributes: PhotoViewHeroAttributes(tag: gal[index].caption),
                  );
                },
                itemCount: gal.length,
              ),
            )
        );
      },
    );
  }
}
