import 'dart:developer';
import 'package:crush/redux/models/Service.dart';
import 'package:crush/util/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:crush/redux/models/app_state.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  // ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) {
        final Map<String, dynamic> args = {
          "services": store.state.info.services,
          "index": store.state.selectedService,
        };
        return args;
      },
      builder: (context, args) {
        final bool isLoading = args["isLoading"];
        final List<Service> services = args["services"];
        final int index = args["index"];

        return Scaffold(
            appBar: AppBar(
              title: Text('Our Service'),
            ),
            body: Column(
              children: [
                Image.network(services[index].images),
                SizedBox(height: 15),
                Text(
                  services[index].title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      letterSpacing: 1),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    services[index].intro,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  ' Time : ' +
                      services[index].time +
                      ' | Price : ' +
                      services[index].price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      letterSpacing: 1),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () async {
                    final DateTime picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                      builder: (BuildContext context, Widget child) {
                        return Theme(
                          data: ThemeData(
                              primarySwatch:
                                  AppColors.primary, //.withOpacity(0.5),
                              primaryColor:
                                  const Color(0xFF4A5BF6), //Head background
                              accentColor:
                                  const Color(0xFF4A5BF6) //selection color
                              ),
                          child: child,
                        );
                      },
                    ).then((date) {
                      if (date != null) {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          builder: (BuildContext context, Widget child) {
                            return Theme(
                              data: ThemeData(
                                  primarySwatch:
                                      AppColors.primary, //.withOpacity(0.5),
                                  primaryColor:
                                      const Color(0xFF4A5BF6), //Head background
                                  accentColor:
                                      const Color(0xFF4A5BF6) //selection color
                                  ),
                              child: child,
                            );
                          },
                        ).then((time) {
                          if (time != null) {
                            String body = 'Need Appointment for : ' +
                                services[index].title;
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
                            log(body + _date + _time);
                            final Uri _emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: 'mazumder.soham34@gmail.com',
                                queryParameters: {
                                  'subject': services[index].title,
                                  'body': body + _date + _time
                                });
                            launch(_emailLaunchUri.toString());
                          }
                        });
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(7)),
                    child: Text('APPOINTMENT',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600)),
                  ),
                )
              ],
            ));
      },
    );
  }
}

