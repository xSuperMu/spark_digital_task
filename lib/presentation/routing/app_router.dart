import 'package:spark_digital/imports.dart';

class AppRouter {
  AppRouter._();

  static const String initial = '/';
  static const String login = '/login';
  static const String forgotPassword = '/forgotPassword';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return SlidePageRouteBuilder(
          builder: (_) => BlocBuilder<AuthStateCubit, AuthStateState>(
            builder: (BuildContext context, state) {
              if (state is AuthStateAuthenticated) {
                return const HomeScreen();
              } else if (state is AuthStateUnAuthenticated) {
                return const RegisterScreen();
              }
              return const Scaffold(
                body: CustomLoadingView(),
              );
            },
          ),
        );
      case login:
        return SlidePageRouteBuilder(
          builder: (_) => const LoginScreen(),
        );
      case forgotPassword:
        return SlidePageRouteBuilder(
          builder: (_) => const ForgetPasswordScreen(),
        );
      default:
        return _undefinedRoute;
    }
  }

  static Route<dynamic> get _undefinedRoute => SlidePageRouteBuilder(
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text(Strings.noRouteFound)),
          body: const Center(child: Text(Strings.noRouteFound)),
        ),
      );
}
