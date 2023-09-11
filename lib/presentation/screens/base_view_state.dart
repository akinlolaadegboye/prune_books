import 'package:prune/extensions/exception.dart';

abstract class BaseViewState {

  final Exception? error;
  final bool showLoading;

  BaseViewState({required this.showLoading, required this.error});

  bool get showConnectionErrorView {
    return !showMainView && (error?.isConnectionError ?? false);
  }

  bool get showMainView;

}