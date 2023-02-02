import 'package:dartaholics/state/auth/models/auth_state.dart';
import 'package:dartaholics/state/auth/notifiers/auth_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
      (_) => AuthStateNotifier(),
);
