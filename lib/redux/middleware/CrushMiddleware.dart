import 'package:crush/redux/actions/action.dart';
import 'package:crush/redux/services/DataService.dart';
import 'package:redux/redux.dart';
import 'package:crush/redux/actions/CrushActions.dart';
import 'package:crush/redux/models/app_state.dart';

List<Middleware<AppState>> crushMiddleware(
	DataService dataService,
){
	return[
    TypedMiddleware<AppState, InitAppAction>(_init(dataService)),
	];
}

void Function(Store<AppState> store, InitAppAction action,NextDispatcher next)
_init(DataService dataService)
{
  return (store, action, next) 
  {
  
    dataService.fetch().then((value){
      // authService.fetch(token, action.email, action.pass, action.name).then((value){
        store.dispatch(SaveInfoAction(value));
        store.dispatch(IsLoadingAction(false));
      // });
    });

    next(action);
  };
}