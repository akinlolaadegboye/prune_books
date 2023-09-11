import 'package:prune/extensions/string.dart';
import 'package:prune/values/strings.dart';

extension ExceptionExt on Exception {

  String get message {
    return toString().replaceFirst('Exception: ', '');
  }

  bool get isAuthorisationError {
    return message.contains(Strings.unauthorizedError);
  }

  bool get isConnectionError {
    return message.contains(Strings.connectionLostMiniText);
  }

  bool get isTechnicalError {
    return message.contains(Strings.internalServerError);
  }

  bool get isPlatformError {
    return message.toLowerCase().contains('flutter');
  }

  bool get hasMessage => message.trim().hasValue;

}