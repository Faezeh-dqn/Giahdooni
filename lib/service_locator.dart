import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:giahdooni/services/authentication_service.dart';
import 'package:giahdooni/services/firestore_service.dart';
import 'package:giahdooni/viewmodels/sign_in_viewmodel.dart';
import 'package:giahdooni/viewmodels/sign_up_viewmodel.dart';

GetIt getIt = GetIt.instance;

setUpGetIt() {
  getIt.registerSingleton<AuthenticationService>(
    AuthenticationService(firebaseAuth: FirebaseAuth.instance),
  );

  getIt.registerSingleton<FirestoreService>(
    FirestoreService(
      fireStore: FirebaseFirestore.instance,
      authenticationService: getIt<AuthenticationService>(),
    ),
  );

  getIt.registerFactory<SignUpViewModel>(
    () => SignUpViewModel(
      authenticationService: getIt<AuthenticationService>(),
      firestoreService: getIt<FirestoreService>(),
    ),
  );

  getIt.registerFactory<SignInViewModel>(
    () =>
        SignInViewModel(authenticationService: getIt<AuthenticationService>()),
  );
}
