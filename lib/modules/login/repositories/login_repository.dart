import 'package:tacaro/shared/models/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> createAccount(
      {required String email, required String password, required String name});
  Future<UserModel> login({required String email, required String password});
}
