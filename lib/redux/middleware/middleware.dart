import 'package:crush/redux/services/DataService.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:crush/redux/middleware/CrushMiddleware.dart';
import 'package:crush/redux/middleware/navigation_middleware.dart';
import 'package:crush/redux/models/app_state.dart';

List<Middleware<AppState>> createMiddleWare(
  GlobalKey<NavigatorState> navigatorKey,
  DataService dataService,
)
{
  return [
    ...createNavigationMiddleware(navigatorKey),
    ...crushMiddleware(dataService),
  ];
}