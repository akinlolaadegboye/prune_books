import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prune/extensions/exception.dart';
import 'package:prune/utils/toast.dart';
import 'package:lottie/lottie.dart';

extension StateWidgetExtension on State {

  void postFrameCallback(VoidCallback callback){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      callback.call();
    });
  }

  Future pushReplacementNamed(String routeId, {Map? arg}) async{
    return await context.pushReplacementNamed(routeId, arg: arg);
  }

  Future pushNamed(String routeId, {Map? arg}) async{
    return await context.pushNamed(routeId, arg: arg);
  }

  Future pushNamedAndRemoveUntil(String routeId, {Map? arg}) async{
    return await context.removeAllPreviousRoutesAndPushNamed(routeId, arg: arg);
  }

  void pop({dynamic result}){
    context.pop(result: result);
  }

  void popUntil(String screenId){
    context.popUntil(screenId);
  }

  Future<bool> switchLoading({required bool show, String? message}) async {
    if (show) {
      if (!_isPdShowing) _showPd(message: message);
    } else {
      if (_isPdShowing) pop();
    }
    return true;
  }

  void _showPd({String? message}) async {
    _setPdShowingStatus(true);
    await showDialog(
      context: context,
      builder: (_) => _createProgressDialog(message),
      barrierDismissible: false,
    );
    _setPdShowingStatus(false);
  }

  WillPopScope _createProgressDialog(String? message) {
    return WillPopScope(
        child: Lottie.asset('assets/gif/progress.json'),
        onWillPop: () => Future.value(false)
    );
  }


  Map get arg {
    final arg = ModalRoute.of(context)?.settings.arguments;
    return arg != null ? arg as Map : {};
  }

  /// This is needed for operations that need to check the [context] is still
  /// mounted before it's triggered (to enhance safety).
  ///
  /// E.g: If [context] is needed for an operation after async-await,
  /// it's important to check that it's still mounted before using it.
  void ifMounted(VoidCallback callback){
    if (mounted) callback.call();
  }

  bool get _isPdShowing{
    if(_pdShowingStatus['$runtimeType'] == null) {
      _setPdShowingStatus(false);
    }

    return _pdShowingStatus['$runtimeType']!;
  }

  void _setPdShowingStatus(bool status){
    _pdShowingStatus['$runtimeType'] = status;
  }

}

Future<bool?> switchError(Exception? error, {Function? onCompleted}) async {
  if (error != null) {
    if (error.isTechnicalError) {
      // await showAlertDialog(context, title: Strings.techErrorTitle, message: Strings.techErrorMessage);
    } else {
      if (!error.isPlatformError) {
        await Toastt.showError(error);
      }
    }

    onCompleted?.call();
    return true;
  }
  return false;
}

extension ScrollControllerExtension on ScrollController{

  void scrollDown() {
    _scrollTo(position.maxScrollExtent);
  }

  void scrollUp() {
    _scrollTo(0);
  }

  void _scrollTo(double position){
    try {
      animateTo(position, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    } catch (e) {
      e.toString();
    }
  }

}

extension BuildContextExt on BuildContext {

  void pop({dynamic result}){
    if (Navigator.canPop(this)) {
      Navigator.pop(this, result);
    } else {
      SystemNavigator.pop();
    }
  }

  void popUntil(String screenId){
    Navigator.popUntil(this, ModalRoute.withName(screenId));
  }

  Future<void> copyTextToClipboard(String text) {
    return Clipboard.setData(ClipboardData(text: text)).then((value){
      Toastt.showMessage('Text copied to clipboard');
    });
  }

  Future pushNamed(String routeName, {Map? arg}) async{
    return await Navigator.pushNamed(this, routeName, arguments: arg);
  }

  Future removeAllPreviousRoutesAndPushNamed(String routeName, {Map? arg}) async{
    return await Navigator.pushNamedAndRemoveUntil(this, routeName, arguments: arg, (Route<dynamic> route) => false);
  }

  Future pushReplacementNamed(String routeName, {Map? arg}) async{
    return await Navigator.pushReplacementNamed(this, routeName, arguments: arg);
  }

}

Map<String, bool> _pdShowingStatus = {};
