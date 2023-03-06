// ignore_for_file: always_specify_types

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'modules/modules.dart';
import 'my_router.dart';

import 'shared/shared.dart';
import 'styles/app_style.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: <SystemUiOverlay>[SystemUiOverlay.bottom, SystemUiOverlay.top]);
  await initDependencies();
  runApp(const MyApp());
  await appLogic.bootstrap();
  FlutterNativeSplash.remove();
}

/// [MyApp]
class MyApp extends StatelessWidget {
  /// const something
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<ConnectivityProvider>(
            create: (_) => ConnectivityProvider(),
          ),
          ChangeNotifierProvider<HomeController>(
            create: (_) => HomeController(getIt<HomeRepository>()),
          ),
          ChangeNotifierProvider<AuthController>(
            create: (_) => AuthController(getIt<AuthRepository>()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Labo001',
          theme: ThemeData(
              fontFamily: $styles.text.body.fontFamily,
              inputDecorationTheme: const InputDecorationTheme().copyWith(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
              )),
          // routerConfig: router,
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
        ),
      );
}

/// Sets up the application by creating a new instance of the Dio HTTP client,
/// creating an instance of the MyAdapter class to modify HTTP requests and responses,
/// registering the Dio instance and the HomeRepository as lazy singletons with the GetIt dependency injection container.
Future<void> initDependencies() async {
  // Create a new instance of the FlutterSecureStorage class
  const FlutterSecureStorage storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  // Register the FlutterSecureStorage instance as a singleton with the GetIt dependency injection container
  getIt.registerSingleton<FlutterSecureStorage>(storage);

  // Create a new instance of the Dio HTTP client
  final Dio dio = Dio();

  // Create an instance of the MyAdapter class to modify HTTP requests and responses
  final MyAdapter myAdapter = MyAdapter();
  dio.httpClientAdapter = myAdapter;

  // Register the Dio instance as a lazy singleton with the GetIt dependency injection container
  getIt.registerLazySingleton(() => dio);

  // Register the HomeRepository as a lazy singleton with the GetIt dependency injection container,
  // retrieving the Dio instance from the container using the getIt<Dio>() syntax
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepository(dio: getIt<Dio>()));

  // Register the AuthRepository as a lazy singleton with the GetIt dependency injection container,
  // retrieving the Dio instance from the container using the getIt<Dio>() syntax
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepository(dio: getIt<Dio>()));
  getIt.registerLazySingleton<AppLogic>(() => AppLogic());
  getIt.registerLazySingleton<SettingsLogic>(() => SettingsLogic());
}

// ...

AppStyle get $styles => MyScaffold.style;
AppLogic get appLogic => getIt<AppLogic>();
SettingsLogic get settingsLogic => getIt<SettingsLogic>();
