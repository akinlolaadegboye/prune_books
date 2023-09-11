import 'package:flutter/widgets.dart';

extension ChangeNotifierExtension on ChangeNotifier {

  /// This safely notifies the listeners to avoid conflict
  /// with the Widget build method.
  void notifyListenersSafely(){
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    Future.delayed(Duration.zero, notifyListeners);
  }

}