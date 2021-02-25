import 'dart:async';

import 'package:d_social/api.dart';
import 'package:d_social/model/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUserEvent) {
      yield* processLoginUser(event);
    } else if (event is LoadingEvent) {
      yield LoadingState();
    }
  }

  Stream<LoginState> processLoginUser(LoginUserEvent event) async* {
    try {
      var loginResponse = await Api.login(event.username, event.password);
      if (loginResponse.error == 200) {
        yield LoginSuccess(loginResponse);
      } else {
        yield LoginFailure(loginResponse.message);
      }
    } catch (e) {
      yield LoginFailure(e.toString());
    }
  }
}
