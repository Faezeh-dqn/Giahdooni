import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:giahdooni/services/authentication_service.dart';
import 'package:giahdooni/services/firebase_storage_service.dart';
import 'package:giahdooni/services/firestore_service.dart';
import 'package:giahdooni/viewmodels/buying_page_viewmodel.dart';
import 'package:giahdooni/viewmodels/diseases_page_viewmodel.dart';
import 'package:giahdooni/viewmodels/home_page_viewmodel.dart';
import 'package:giahdooni/viewmodels/orders_Page_viewmodel.dart';
import 'package:giahdooni/viewmodels/paying_page_viewmodel.dart';
import 'package:giahdooni/viewmodels/paymentGateway_page_viewmodel.dart';
import 'package:giahdooni/viewmodels/profile_page_viewmodel.dart';
import 'package:giahdooni/viewmodels/search_bar_view_model.dart';
import 'package:giahdooni/viewmodels/sign_in_viewmodel.dart';
import 'package:giahdooni/viewmodels/sign_up_viewmodel.dart';
import 'package:giahdooni/viewmodels/successful_page_viewmodel.dart';

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

  getIt.registerSingleton<FirebaseStorageService>(
    FirebaseStorageService(
      firebaseStorage: FirebaseStorage.instance,
    ),
  );

  getIt.registerFactory<SignUpViewModel>(
    () => SignUpViewModel(
      authenticationService: getIt<AuthenticationService>(),
      firestoreService: getIt<FirestoreService>(),
    ),
  );

  getIt.registerFactory<PaymentGViewModel>(() => PaymentGViewModel());

  getIt.registerFactory<BuyingPageViewModel>(
    () => BuyingPageViewModel(
      firestoreService: getIt<FirestoreService>(),
    ),
  );

  getIt.registerSingleton<HomePageViewModel>(
    HomePageViewModel(
      firestoreService: getIt<FirestoreService>(),
    ),
  );

  getIt.registerSingleton<ProfilePageViewModel>(
    ProfilePageViewModel(
      authenticationService: getIt<AuthenticationService>(),
      firestoreService: getIt<FirestoreService>(),
      firebaseStorageService: getIt<FirebaseStorageService>(),
    ),
  );

  getIt.registerSingleton<OrdersPageViewModel>(
    OrdersPageViewModel(
      firestoreService: getIt<FirestoreService>(),
    ),
  );

  getIt.registerSingleton<DiseasesPageViewModel>(
    DiseasesPageViewModel(
      firestoreService: getIt<FirestoreService>(),
    ),
  );

  getIt.registerSingleton<successfulPaymentViewModel>(
      successfulPaymentViewModel());

  getIt.registerFactory<SearchBarPageViewModel>(
    () => SearchBarPageViewModel(
      firestoreService: getIt<FirestoreService>(),
    ),
  );

  getIt.registerFactory<PayingPageViewModel>(
      () => PayingPageViewModel(firestoreService: getIt<FirestoreService>()));

  getIt.registerFactory<SignInViewModel>(
    () =>
        SignInViewModel(authenticationService: getIt<AuthenticationService>()),
  );
  getIt.registerSingleton<PageController>(PageController(initialPage: 1));
}
