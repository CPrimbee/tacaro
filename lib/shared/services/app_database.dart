import 'package:tacaro/shared/models/user_model.dart';
import 'package:tacaro/shared/services/supabase_database.dart';

abstract class AppDatabase {
  static final AppDatabase instance = SupabaseDatabase();
  void init();
  Future<UserModel> createUser(UserModel user);
  Future<UserModel> getUser(String id);
  Future<UserModel> createAccount({
    required String email,
    required String password,
    required String name,
  });
  Future<UserModel> login({required String email, required String password});
}
