import 'package:dartz/dartz.dart';
import '../../../../core/http/failure.dart';
import '../../data/models/remote/user/user_model.dart';
import '../repositories/auth_repository.dart';

abstract class GoogleUseCase {
  Future<Either<Failure, UserModel>> execute(context);
}

class GoogleAuthUseCase extends GoogleUseCase{
  final AuthRepository _authRepository;
  GoogleAuthUseCase(this._authRepository);

  @override
  Future<Either<Failure, UserModel>> execute(context) async {
    return await _authRepository.signInWithGoogle(context: context);
  }
}