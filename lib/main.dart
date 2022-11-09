import 'package:spark_digital/imports.dart';

var logger = Logger();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupDependencyInjection();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getItInstance<LoadingCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              getItInstance<AuthStateCubit>()..authStateChanges(),
        ),
      ],
      child: MaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        builder: (context, widget) {
          return BlocBuilder<LoadingCubit, bool>(
            builder: (context, state) {
              return Stack(
                children: [
                  widget!,
                  if (state)
                    const Positioned.fill(
                      child: CustomLoadingView(),
                    ),
                ],
              );
            },
          );
        },
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRouter.initial,
      ),
    );
  }
}
