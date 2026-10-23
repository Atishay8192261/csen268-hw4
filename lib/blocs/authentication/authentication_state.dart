part of 'authentication_bloc.dart';

sealed class AuthenticationState {}

class AuthenticationNotLoggedIn extends AuthenticationState {}

class AuthenticationLoggedIn extends AuthenticationState {}
