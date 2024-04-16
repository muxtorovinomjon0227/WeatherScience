import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weather_science/src/core/utils/app_utils.dart';
import '../../../../core/http/error_handler.dart';
import '../../../../core/http/failure.dart';
import '../../../../core/services/on_connectivity_changed_service.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {

  @override
  Future<Either<Failure, User>> signInWithGoogle({required BuildContext context}) async {
    if (await InternetService.isConnection()) {
      try {
        final GoogleSignIn googleSignIn = GoogleSignIn();
        final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = userCredential.user;
        AppUtils.user = user!;
        return Right(user);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, dynamic>> signInEmailPassword({required BuildContext context}) async {
    if (await InternetService.isConnection()) {

      try {
        return Right("sdf");
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}
