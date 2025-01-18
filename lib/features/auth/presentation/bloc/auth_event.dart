// lib\features\auth\presentation\bloc\auth_event.dart

abstract class AuthEvent {}

class LoadAuthEvent extends AuthEvent {}

class SignInPressed extends AuthEvent {}
