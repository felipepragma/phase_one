
import 'package:phase_one_app/data/source/password_repository_impl.dart';
import 'package:phase_one_app/domain/entities/password.dart';
import 'package:phase_one_app/domain/repository/password_repository.dart';
import 'package:phase_one_app/usecases/interface_password_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 
/// UseCase implementation
/// 
/// extends interface [IPasswordUseCase]
/// 
/// [getAllPassword] : method used to read a list of passwords
/// [savePassword] : method used to save a list of passwords
/// [updatePasswordById] : method used to update a password by uuid
/// [deletePasswordById] : method used to delete a password by uuid
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
  void updatePasswordById(String? uuid, PasswordModel? passwordModel) {
    passwordRepository?.updatePasswordById(uuid, passwordModel);
  }

  @override
  List<PasswordModel> getAllPassword() {
    return passwordRepository?.getAllPassword() ?? [];
  }
  
  @override
  void deletePasswordById(String? uuid) {
    passwordRepository?.deletePasswordById(uuid);
  }
}

