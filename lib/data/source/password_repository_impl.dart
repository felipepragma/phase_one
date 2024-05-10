import 'package:phase_one_app/data/datasource/datasource.dart';
import 'package:phase_one_app/data/datasource/interface_datasource.dart';
import 'package:phase_one_app/domain/entities/password.dart';
import 'package:phase_one_app/domain/repository/password_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 
/// Repository implementation
/// 
/// extends interface [PasswordRepository]
/// 
/// [getAllPassword] : method used to read a list of passwords
/// [savePassword] : method used to save a list of passwords
/// [updatePasswordById] : method used to update a password by uuid
/// [deletePasswordById] : method used to delete a password by uuid
/// 
class PasswordRepositoryImpl extends PasswordRepository {

  IDataSource? dataSource;

  PasswordRepositoryImpl(SharedPreferences? sharedPreferences) {
    dataSource = DataSource(sharedPreferences);
  }

  @override
  List<PasswordModel> getAllPassword() {
    return dataSource?.readPasswords() ?? [];
  }

  @override
  void savePassword(PasswordModel passwordModel) {
    final list = getAllPassword();
    list.add(passwordModel);
    dataSource?.savePasswords(list);
  }
  
  @override
  void updatePasswordById(String? uuid, PasswordModel? passwordModel) {
    if (passwordModel == null) return;
    final list = getAllPassword();
    final index = list.indexWhere((passwordModel) => passwordModel.uuid == uuid);
    list[index] = passwordModel;
    dataSource?.savePasswords(list);
  }
  
  @override
  void deletePasswordById(String? uuid) {
    if (uuid == null) return;
    final list = getAllPassword();
    final index = list.indexWhere((passwordModel) => passwordModel.uuid == uuid);
    list.removeAt(index);
    dataSource?.savePasswords(list);
  }
}