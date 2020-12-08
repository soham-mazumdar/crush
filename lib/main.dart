import 'package:crush/redux/services/DataService.dart';
import 'package:crush/ui/Pages/AboutPage.dart';
import 'package:crush/ui/Pages/ContactPage.dart';
import 'package:crush/ui/Pages/GalleryPage.dart';
import 'package:crush/ui/Pages/ServicePage.dart';
import 'package:crush/ui/Pages/ServicesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:crush/redux/actions/action.dart';
import 'package:crush/redux/middleware/middleware.dart';
import 'package:crush/redux/models/app_state.dart';
import 'package:crush/redux/reducers/base_reducer.dart';
import 'package:crush/redux/routes/routes.dart';
import 'package:crush/ui/Pages/HomePage.dart';
import 'package:crush/util/ui_constants.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Store<AppState> store = Store<AppState>(
    baseReducer,
    initialState: AppState.initial(),
    
    middleware: createMiddleWare(
      navigatorKey,
      DataService(),
    )
  );
  store.dispatch(InitAppAction());
  return runApp(HindApp(store));
}

class HindApp extends StatelessWidget {
  
  final Store<AppState> store;

  HindApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner : false,
        navigatorKey:navigatorKey,
        navigatorObservers: [routeObserver],
        theme: getThemeData(),
        onGenerateRoute: (RouteSettings settings) => _resolveRoute(settings),
      ),
    );
  }

  MaterialPageRoute _resolveRoute(RouteSettings settings)
	{
		switch(settings.name)
		{
			case AppRoutes.services:
		   	return FabRoute(ServicesPage(), settings: settings, duration: 400);//, direction: 'right');
      case AppRoutes.service:
		   	return FabRoute(ServicePage(), settings: settings, duration: 400);
      case AppRoutes.gallery:
        return FabRoute(GalleryPage(), settings: settings, duration: 400);//, direction: 'right');
      case AppRoutes.about:
        return FabRoute(AboutPage(), settings: settings, duration: 400);
      case AppRoutes.contact:
        return FabRoute(ContactPage(), settings: settings, duration: 400);
      default :
        return MainRoute(HomePage(), settings : settings,);
		}
	}
}

