import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weather_science/src/core/services/hive_service.dart';
import 'package:weather_science/src/core/utils/app_utils.dart';
import '../../../../core/http/api_service.dart';
import '../../../../core/http/error_handler.dart';
import '../../../../core/http/failure.dart';
import '../../../../core/services/on_connectivity_changed_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/remote/user/user_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ApiService _apiService;
  AuthRepositoryImpl(this._apiService);
  @override
  Future<Either<Failure, UserModel>> signInWithGoogle({required BuildContext context}) async {
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
        AppUtils.user = UserModel(
            email: userCredential.user?.email ?? "",
            userName: userCredential.user?.displayName ?? "",
            imageUrl: userCredential.user?.photoURL ?? "");
        HiveService.saveUserInfo(AppUtils.user.toJson());
        return Right(AppUtils.user);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUpEmailPassword({required BuildContext context, required String email, required String password}) async {
    if (await InternetService.isConnection()) {
      try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password,);
        AppUtils.user = UserModel(
            imageUrl: credential.user?.photoURL ?? "",
            email: credential.user?.email ?? "",
            userName: credential.user?.displayName ?? "");
        HiveService.saveUserInfo(AppUtils.user.toJson());
        return Right(AppUtils.user);
      } on FirebaseAuthException catch (e) {
        return Left(Failure(-7,e.message ?? ""));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInEmailPassword({required BuildContext context, required String email, required String password}) async {
    if (await InternetService.isConnection()) {
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        AppUtils.user = UserModel(
            imageUrl: credential.user?.photoURL ?? "",
            email: credential.user?.email ?? "",
            userName: credential.user?.displayName ?? "");
        HiveService.saveUserInfo(AppUtils.user.toJson());
        return Right(AppUtils.user);
      } on FirebaseAuthException catch (e) {
        return Left(Failure(-7,e.message ?? ""));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
