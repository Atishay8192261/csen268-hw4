import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationNotLoggedIn()) {
    on<AuthenticationLoginEvent>((event, emit) {
      emit(AuthenticationLoggedIn());
    });
    on<AuthenticationLogoutEvent>((event, emit) {
      emit(AuthenticationNotLoggedIn());
    });
  }
}
