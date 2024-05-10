import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phase_one_app/presentation/providers/passwords_notifier.dart';
import 'package:phase_one_app/presentation/providers/providers.dart';
import 'package:phase_one_app/usecases/interface_password_case.dart';

///
/// Provider used for riverpod
/// 
/// [passwordProvider] : Provider
/// 
final passwordProvider =
    StateNotifierProvider<PasswordNotifier, IPasswordUseCase>((ref) {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    return PasswordNotifier(sharedPreferences.value);
});