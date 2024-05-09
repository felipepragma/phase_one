
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phase_one_app/core/domain/entities/password.dart';
import 'package:phase_one_app/core/presentation/providers/providers.dart';
import 'package:phase_one_app/core/usecases/password_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Provider used for riverpod
/// 
/// [passwordProvider] : Provider
/// 
final passwordProvider =
    StateNotifierProvider<PersonNotifier, IPasswordUseCase>((ref) {
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    return PersonNotifier(sharedPreferences.value);
});

///
/// Notifier used for riverpod
/// 
/// [PersonNotifier] : Notifier
/// 
/// [savePassword] : method used to save a list of passwords
/// [getAllPassword] : method used to read a list of passwords
/// 
class PersonNotifier extends StateNotifier<IPasswordUseCase> {
  List<PasswordModel> list = [];
  PersonNotifier(SharedPreferences? sharedPreferences) : super(PasswordUseCase(sharedPreferences));

  void savePassword(PasswordModel passwordModel) {
    state.savePassword(passwordModel);
  }

  List<PasswordModel> getAllPassword() {
    return state.getAllPassword();
  }
}