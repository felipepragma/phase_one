import 'package:phase_one_app/domain/entities/password.dart';

/// 
/// Repository interface
/// 
/// 
/// [getAllPassword] : method used to read a list of passwords
/// [savePassword] : method used to save a list of passwords
/// [updatePasswordById] : method used to update a password by uuid
/// 
abstract class PasswordRepository {
  void savePassword(PasswordModel passwordModel);
  void updatePasswordById(String? uuid, PasswordModel? passwordModel);
  void deletePasswordById(String? uuid);
  List<PasswordModel> getAllPassword();
}