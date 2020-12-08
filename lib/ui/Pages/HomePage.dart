import 'package:crush/redux/models/InfoModel.dart';
import 'package:crush/redux/routes/routes.dart';
import 'package:crush/util/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:crush/redux/actions/navigator_actions.dart';
import 'package:crush/redux/models/app_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

        return Scaffold(
            body: isLoading
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: kToolbarHeight),
                        Center(
                          // width: MediaQuery.of(context).size.width,
                          // padding: EdgeInsets.fromLTRB(20, 70, 20, 20),
                          child: Image.network(
                            'https://static.wixstatic.com/media/b37b63_909914ce7b6048e7b987a8849bfa408a~mv2.jpg/v1/fill/w_434,h_202,al_c,q_80,usm_0.66_1.00_0.01/crushlogo_color_web.webp',
                            width: 200,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            info.intro,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GridView(
                          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          children: [
                            GestureDetector(
                              onTap: () {
                                navigate(AppRoutes.services);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                  margin: EdgeInsets.all(20),
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(140)),
                                  child: Center(
                                    child: Text(
                                      'SERVICES',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white,fontSize: 20, letterSpacing: 1),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                navigate(AppRoutes.gallery);
                              },
                              child: Container(
                                  margin: EdgeInsets.all(20),
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: AppColors.secondary,
                                      borderRadius: BorderRadius.circular(140)),
                                  child: Center(
                                    child: Text(
                                      'GALLERY',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white,fontSize: 20, letterSpacing: 1),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                navigate(AppRoutes.contact);
                              },
                              child: Container(
                                  margin: EdgeInsets.all(20),
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: AppColors.secondary,
                                      borderRadius: BorderRadius.circular(140)),
                                  child: Center(
                                    child: Text(
                                      'CONTACT',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white,fontSize: 20, letterSpacing: 1),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                navigate(AppRoutes.about);
                              },
                              child: Container(
                                  margin: EdgeInsets.all(20),
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(140)),
                                  child: Center(
                                    child: Text(
                                      'KNOW US',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white,fontSize: 20, letterSpacing: 1),
                                    ),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
            
            );
      },
    );
  }
}
