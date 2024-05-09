
import 'package:phase_one_app/core/data/source/password_repository_impl.dart';
import 'package:phase_one_app/core/domain/entities/password.dart';
import 'package:phase_one_app/core/domain/repository/password_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 
/// UseCase interface
/// 
/// [getAllPassword] : method used to save a list of passwords
/// [savePassword] : method used to read a list of passwords
/// 
abstract class IPasswordUseCase {
  void savePassword(PasswordModel passwordModel);
  List<PasswordModel> getAllPassword();
}

/// 
/// UseCase implementation
/// 
/// extends interface [IPasswordUseCase]
/// 
/// [getAllPassword] : method used to save a list of passwords
/// [savePassword] : method used to read a list of passwords
/// 
class PasswordUseCase extends IPasswordUseCase {

  PasswordRepository? passwordRepository; 

  PasswordUseCase(SharedPreferences? sharedPreferences) {
    passwordRepository = PasswordRepositoryImpl(sharedPreferences);
  }

  @override
  void savePassword(PasswordModel passwordModel) {
    passwordRepository?.savePassword(passwordModel);
  }

  @override
  List<PasswordModel> getAllPassword() {
    return passwordRepository?.getAllPassword() ?? [];
  }
}

