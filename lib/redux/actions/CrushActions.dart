import 'package:crush/redux/models/InfoModel.dart';
import 'package:crush/redux/actions/action.dart';

class IsLoadingAction extends AppAction{
  final bool isLoading;
  IsLoadingAction(this.isLoading);

  @override String toString() => "IsLoadingAction{$isLoading}";
}

class FetchJsonAction extends AppAction{}

class SaveInfoAction extends AppAction {
    final Info info;
    SaveInfoAction(this.info);

    @override 
    String toString() {
      return "SaveInfoAction{$info}";
    }
}

class SaveSelectedServiceAction extends AppAction{
  final int index;
  SaveSelectedServiceAction(this.index);

  @override 
  String toString() {
    return "SaveSelectedServiceAction{$index}";
  }
}
