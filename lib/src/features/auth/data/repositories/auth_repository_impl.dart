import 'package:hive/hive.dart';
import '../../../../core/consts/apis/api_endpoints.dart';
import '../../../../core/http/dio.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/remote/user/user.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<User?> login(String login, String password) async {
      final data = {
        'email': login,
        'password': password,
      };
      final response = await dio.post(
        ApiEndpoints.oneDay,
        data: data,
      );
      final tokenBox = Hive.box('token');
      await tokenBox.put('token', response.data['tokens']['refreshToken']);
      final user = User.fromJson(response.data['user']);
      return user;
  }
}
