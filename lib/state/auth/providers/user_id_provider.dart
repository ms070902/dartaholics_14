import 'package:dartaholics/state/auth/providers/auth_state_provider.dart';
import 'package:dartaholics/state/auth/typedef.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final userIdProvider = Provider<UserId?>(
      (ref) => ref.watch(authStateProvider).userId,
);
