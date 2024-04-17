import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/http/failure.dart';
import '../../data/models/remote/user/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signInWithGoogle({required BuildContext context});
  Future<Either<Failure, UserModel>> signUpEmailPassword({required BuildContext context,required String email,required String password});
  Future<Either<Failure, UserModel>> signInEmailPassword({required BuildContext context,required String email,required String password});
}
