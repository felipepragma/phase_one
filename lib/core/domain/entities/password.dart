
import 'dart:convert';

///
/// Model used for passwords
/// 
/// [name] : Name password
/// [pass] : password
/// [description] : Description of password
/// 
class PasswordModel {

  String? name;
  String? pass;
  String? description;

  PasswordModel({
    this.name,
    this.pass,
    this.description,
  });

  factory PasswordModel.fromJson(Map<String, dynamic> jsonData) {
    return PasswordModel(
      name: jsonData['name'],
      pass: jsonData['pass'],
      description: jsonData['description']
    );
  }

  static String encode(List<PasswordModel> list) => json.encode(
    list
      .map<Map<String, dynamic>>((password) => PasswordModel.toMap(password))
      .toList(),
  );

  static List<PasswordModel> decode(String listString) =>
    (json.decode(listString) as List<dynamic>)
      .map<PasswordModel>((item) => PasswordModel.fromJson(item))
      .toList();

  static Map<String, dynamic> toMap(PasswordModel password) => {
    'name': password.name,
    'pass': password.pass,
    'description': password.description
  };
}