part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {}

class AuthenticationLoginEvent extends AuthenticationEvent {}

class AuthenticationLogoutEvent extends AuthenticationEvent {}
