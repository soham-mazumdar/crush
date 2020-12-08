

import 'package:crush/redux/actions/CrushActions.dart';
import 'package:crush/redux/models/InfoModel.dart';
import 'package:redux/redux.dart';

final infoReducer = combineReducers<Info>([TypedReducer<Info, SaveInfoAction>(_saveInfo),]);
Info _saveInfo(Info info, SaveInfoAction action) => action.info;


final isLoadingReducer = combineReducers<bool>([TypedReducer<bool, IsLoadingAction>(_saveIsLoading)]);
bool _saveIsLoading(bool isLoading, IsLoadingAction action) => action.isLoading;


final selectedServiceReducer = combineReducers<int>([TypedReducer<int, SaveSelectedServiceAction>(_saveSelectedService)]);
int _saveSelectedService(int isLoading, SaveSelectedServiceAction action) => action.index;