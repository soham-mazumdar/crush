import 'dart:developer';

import 'package:crush/redux/models/GalModel.dart';
import 'package:crush/redux/models/InfoModel.dart';
import 'package:crush/redux/models/Service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:crush/redux/models/app_state.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) {
        final Map<String, dynamic> args = {
          "info": store.state.info,
          "index": store.state.selectedService,
        };
        return args;
      },
      builder: (context, args) {
        final bool isLoading = args["isLoading"];
        final Info info = args["info"];
        // final int index = args["index"];

        return Scaffold(
            appBar: AppBar(
              title: Text('About Us'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20, 70, 20, 20),
                    child: Image.network(
                      'https://static.wixstatic.com/media/b37b63_909914ce7b6048e7b987a8849bfa408a~mv2.jpg/v1/fill/w_434,h_202,al_c,q_80,usm_0.66_1.00_0.01/crushlogo_color_web.webp',
                      width: 200,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      info.bio,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )

        );
      },
    );
  }
}
