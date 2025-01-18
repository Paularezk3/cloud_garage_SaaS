// lib\features\auth\presentation\bloc\auth_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthPageInit()) {
    on<LoadAuthEvent>(
      (event, emit) {},
    );
  }
}
