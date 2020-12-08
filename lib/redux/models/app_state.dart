import 'package:crush/redux/models/InfoModel.dart';
import 'package:crush/redux/routes/routes.dart';

class AppState {
  final bool isLoading;
  final Info info;
  final int selectedService;

  
  final List<String> routes;
  

  AppState({
    this.isLoading,
    this.info,
    this.selectedService,

    this.routes,
  });

  factory AppState.initial(){
    return AppState(
      isLoading: true,
      // info: null,
      routes: [AppRoutes.home],
    );
  }

  AppState copyWith({
    bool newIsLoading,
    Info newInfO,
    List<String> newRoutes,
    int newSelectedService
  })
  {
    return AppState(
      isLoading: newIsLoading ?? this.isLoading,
      info: newInfO ?? this.info,
      routes: newRoutes ?? this.routes,
      selectedService: newSelectedService ?? this.selectedService,
    );
  }
}