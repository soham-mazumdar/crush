// import 'dart:convert';

// import 'package:redux/redux.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:crush/redux/actions/CrushActions.dart';
// import 'package:crush/redux/actions/ThoughtAction.dart';
// import 'package:crush/redux/actions/action.dart';
// import 'package:crush/redux/models/Quote.dart';
// import 'package:crush/redux/models/app_state.dart';
// import 'package:crush/redux/services/AuthService.dart';
// import 'package:crush/redux/services/WPService.dart';

// List<Middleware<AppState>> initMiddleware(
// 	AuthService authService,
//   WPService wpService,
// ){
// 	return[
//     TypedMiddleware<AppState, InitAppAction>(_init(authService,wpService)),
// 	];
// }

// void Function(Store<AppState> store, InitAppAction action, NextDispatcher next)
// _init(AuthService authService, WPService wpService)
// {
//   return (store, action, next) async {

//     // print(store.state.selectedUserIDs);

//     // AUTO SIGNIN
//     authService.signIn().then((value){
//       print(value);
      
//       if(value != null){
//         store.dispatch(SaveUserAction(value));
//         wpService.fetchPosts().then((thoughts){
//           store.dispatch(SaveThoughtsAction(thoughts));
//           store.dispatch(IsLoadingAction(false));
//         });
//       }
      
//     });
    
//     SharedPreferences prefs = await SharedPreferences.getInstance();
    
//     // AUTO GET FOLLOWINGS
//     String following_s = prefs.getString('following') ?? '[]';
//     List<dynamic> following = jsonDecode(following_s);
//     List<int> ids = [];
//     following.forEach((element) { 
//       ids.add(element);
//     });
//     store.dispatch(SaveSelectedUserAction(ids));


//     // AUTO SAVED
//     String saved = prefs.getString('saved') ?? '[]';
//     List savedJson = jsonDecode(saved);
//     List<Thought> saveThought = [];
    
//     for (var item in savedJson) {
//       saveThought.add(
//         Thought(
//           authorID: item['authorID'],
//           authorName: item['authorName'],
//           content: item['content'],
//           id: item['id'],
//           title: item['title'],
//         )
//       );
//     }
//     store.dispatch(GetFeedLocallyAction(saveThought));

//     next(action);
//   };
// }
