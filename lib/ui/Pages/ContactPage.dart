import 'dart:developer';

import 'package:crush/redux/models/InfoModel.dart';
import 'package:crush/redux/routes/routes.dart';
import 'package:crush/util/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// import 'package:crush/redux/actions/ThoughtAction.dart';
import 'package:crush/redux/actions/navigator_actions.dart';
import 'package:crush/redux/models/app_state.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) {
        final Map<String, dynamic> args = {
          "isLoading": store.state.isLoading,
          "info": store.state.info,
          "navigate": (navTo) {
            return store.dispatch(NavigatorPushAction(navTo));
          },
        };
        return args;
      },
      builder: (context, args) {
        final bool isLoading = args["isLoading"];
        final Info info = args["info"];
        final Function navigate = args["navigate"];
        log(info.openingHours.toString());

        return Scaffold(
            appBar: AppBar(
              title: Text('Contact Us'),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.network(
                    'https://static.wixstatic.com/media/b37b63_909914ce7b6048e7b987a8849bfa408a~mv2.jpg/v1/fill/w_434,h_202,al_c,q_80,usm_0.66_1.00_0.01/crushlogo_color_web.webp',
                    width: 200,
                  ),
                ),
                SizedBox(height: 10),
                Text(info.openingHours),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:20),
                  child: Text(info.intro, textAlign: TextAlign.center,)),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    String lat = '33.92670372127023'; //info.map[0];
                    String lang = '-84.54543669050403';//info.map[1];
                    String googleMapslocationUrl = "https://www.google.com/maps/search/?api=1&query=${lat},${lang}";

                    final String encodedURl = Uri.encodeFull(googleMapslocationUrl);
                    launch(encodedURl);
                  },
                  child: Container(
                    padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(7)),
                    child: Text(
                      'Get Direction',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1
                      )
                    )
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Uri _emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: info.email,
                        queryParameters: {
                          'subject': 'Requesting Appointment',
                        });
                    launch(_emailLaunchUri.toString());
                  },
                  child: Container(
                    padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(7)),
                    child: Text(
                      'Mail : ' + info.email,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1
                      )
                    )
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: (){
                    launch('tel:${info.phone}');
                  },
                  child: Container(
                    padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(7)),
                    child: Text(
                      'Phone : ' + info.phone,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1
                      )
                    )
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    final DateTime picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101))
                        .then((date) {
                      if (date != null) {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((time) {
                          if (time != null) {
                            String body = 'Need Appointment : ';
                            String _date = '\nOn : ' +
                                date.day.toString() +
                                '/' +
                                date.month.toString() +
                                '/' +
                                date.year.toString();
                            String _time = '\nat : ' +
                                time.hour.toString() +
                                ':' +
                                time.minute.toString();
                            // log(body + _date + _time);
                            final Uri _emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: 'mazumder.soham34@gmail.com',
                                queryParameters: {
                                  'subject': 'Requesting Appointment',
                                  'body': body + _date + _time
                                });
                            launch(_emailLaunchUri.toString());
                          }
                        });
                      }
                    });
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(7)),
                      child: Text(
                        'Book An Appointment',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            letterSpacing: 1
                          )
                      )
                  ),
                ),
              ],
            ));
      },
    );
  }
}
