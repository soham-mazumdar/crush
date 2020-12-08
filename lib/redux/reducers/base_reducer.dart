
import 'package:crush/redux/models/app_state.dart';
import 'package:crush/redux/reducers/InfoReducers.dart';
// import 'package:crush/redux/reducers/UserReducers.dart';
import 'package:crush/redux/reducers/navigation_reducer.dart';

AppState baseReducer(AppState oldState, dynamic action)
{
  return oldState.copyWith(
    newInfO: infoReducer(oldState.info, action),
    newSelectedService: selectedServiceReducer(oldState.selectedService, action),
    // newThoughts: thoughtsReducer(oldState.thoughts, action),
    newIsLoading: isLoadingReducer(oldState.isLoading, action),
    // newSelectedUserIDs: selectedUserReducer(oldState.selectedUserIDs, action),
    // newFollowedFeeds: followedFeedsReducer(oldState.followedFeeds, action),
    // newSavedFeeds: savedFeedsReducer(oldState.savedFeeds, action),
    
    newRoutes: navigationReducer(oldState.routes, action),
    
  );
}