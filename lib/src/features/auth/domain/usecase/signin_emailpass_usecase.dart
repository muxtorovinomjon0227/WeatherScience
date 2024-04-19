import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/http/failure.dart';
import '../../data/models/remote/user/user_model.dart';
import '../repositories/auth_repository.dart';

abstract class EmailPassSignInCase {
  Future<Either<Failure, UserModel>> execute(BuildContext context, String email,String password);
}

class EmailPassSignInUseCase extends EmailPassSignInCase {
  final AuthRepository _authRepository;
  EmailPassSignInUseCase(this._authRepository);

  @override
  Future<Either<Failure, UserModel>> execute(context,email,password) async {
    return await _authRepository.signInEmailPassword(context: context, email: email,password: password);
  }
}