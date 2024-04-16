import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/http/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signInWithGoogle({required BuildContext context});
  Future<Either<Failure, dynamic>> signUpEmailPassword({required BuildContext context,required String email,required String password});
  Future<Either<Failure, dynamic>> signInEmailPassword({required BuildContext context,required String email,required String password});
}
