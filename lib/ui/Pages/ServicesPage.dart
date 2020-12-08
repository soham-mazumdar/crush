import 'package:crush/redux/actions/CrushActions.dart';
import 'package:crush/redux/models/Service.dart';
import 'package:crush/redux/routes/routes.dart';
import 'package:crush/util/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:crush/redux/actions/navigator_actions.dart';
import 'package:crush/redux/models/app_state.dart';

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  // ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) {
        final Map<String, dynamic> args = {
          "services": store.state.info.services,
          "selected": (int index) {
            store.dispatch(SaveSelectedServiceAction(index));
            return store.dispatch(NavigatorPushAction(AppRoutes.service));
          },
        };
        return args;
      },
      builder: (context, args) {
        final List<Service> services = args["services"];
        final Function selected = args["selected"];

        return Scaffold(
            appBar: AppBar(
              title: Text('Our Service'),
            ),
            body: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      selected(index);
                    },
                    child: Container(
                      padding: EdgeInsets.all(7),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: index == 0 || index % 2 == 0
                              ? AppColors.primary.withOpacity(0.2)
                              : AppColors.secondary.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(125),
                            bottomLeft: Radius.circular(125),
                          )),
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(services[index].images)),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  services[index].title,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      letterSpacing: 1),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  services[index].desc,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                }));
      },
    );
  }
}
