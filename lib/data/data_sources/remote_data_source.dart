import 'package:spark_digital/imports.dart';

abstract class RemoteDataSource {
  Future<void> login(LoginModel loginModel);

  Future<UserModel> register(RegisterModel registerModel);

  Future<void> logout();

  Future<void> forgotPassword(String email);

  Future<UserModel> fetchUserData();

  Stream<User?> authStateChanges();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseAuth fireBaseAuth;
  final FirebaseFirestore fireStore;

  const RemoteDataSourceImpl(this.fireBaseAuth, this.fireStore);

  @override
  Future<void> login(LoginModel loginModel) async {
    try {
      await fireBaseAuth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == AppConstants.firebaseAuthUserNotFoundCode) {
        throw const UserNotFoundException(Strings.authUserNotFound);
      } else if (e.code == AppConstants.firebaseAuthWrongPassword) {
        throw const WrongPasswordException(Strings.authWrongPassword);
      } else {
        throw const UnknownException(Strings.authUnknownError);
      }
    }
  }

  @override
  Future<UserModel> register(RegisterModel registerModel) async {
    try {
      final userCredential = await fireBaseAuth.createUserWithEmailAndPassword(
        email: registerModel.email,
        password: registerModel.password,
      );
      final userId = userCredential.user!.uid;

      final userModel = UserModel(
        uid: userId,
        name: registerModel.name,
        email: registerModel.email,
        gender: registerModel.gender,
        yearOfBirth: registerModel.yearOfBirth,
      );

      fireStore.collection('Users').doc(userId).set(userModel.toJson());
      return userModel;
    } on FirebaseAuthException catch (e) {
      if (e.code == AppConstants.firebaseAuthWeakPassword) {
        throw const WeakPasswordException(Strings.authWeakPassword);
      } else if (e.code == AppConstants.firebaseAuthEmailAlreadyUsed) {
        throw const EmailAlreadyRegisteredException(
            Strings.authAccountAlreadyRegistered);
      } else {
        throw const UnknownException(Strings.authUnknownError);
      }
    }
  }

  @override
  Future<void> logout() async {
    await fireBaseAuth.signOut();
  }

  @override
  Future<void> forgotPassword(String email) async {
    await fireBaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<UserModel> fetchUserData() async {
    try {
      final userId = fireBaseAuth.currentUser!.uid;
      final fireSnapshot =
          await fireStore.collection('Users').doc(userId).get();
      if (fireSnapshot.exists) {
        return UserModel.fromJson(fireSnapshot.data()!);
      } else {
        throw const UserNotFoundException(Strings.authUserNotFound);
      }
    } catch (e) {
      throw const UnknownException(Strings.authUnknownError);
    }
  }

  @override
  Stream<User?> authStateChanges() {
    return fireBaseAuth.authStateChanges();
  }
}
