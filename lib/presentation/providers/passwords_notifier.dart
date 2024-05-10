import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phase_one_app/domain/entities/password.dart';
import 'package:phase_one_app/usecases/interface_password_case.dart';
import 'package:phase_one_app/usecases/password_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Notifier used for riverpod
/// 
/// [PasswordNotifier] : Notifier
/// 
/// [savePassword] : method used to save a list of passwords
/// [getAllPassword] : method used to read a list of passwords
/// 
class PasswordNotifier extends StateNotifier<IPasswordUseCase> {
  List<PasswordModel> list = [];
  PasswordNotifier(SharedPreferences? sharedPreferences) : super(PasswordUseCase(sharedPreferences));

  void savePassword(PasswordModel passwordModel) {
    state.savePassword(passwordModel);
  }

  List<PasswordModel> getAllPassword() {
    return state.getAllPassword();
  }
}