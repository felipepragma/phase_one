import 'package:phase_one_app/core/domain/entities/password.dart';

/// 
/// Repository interface
/// 
/// 
/// [getAllPassword] : method used to save a list of passwords
/// [savePassword] : method used to read a list of passwords
/// 
abstract class PasswordRepository {
  void savePassword(PasswordModel passwordModel);
  List<PasswordModel> getAllPassword();
}