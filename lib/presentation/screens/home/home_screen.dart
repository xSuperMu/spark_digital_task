import 'package:spark_digital/imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getItInstance<LogoutCubit>(),
        ),
        BlocProvider(
          create: (context) => getItInstance<FetchUserCubit>()..fetchUserData(),
        ),
      ],
      child: BlocConsumer<LogoutCubit, LogoutState>(
        listener: (context, state) {
          if (state is! LogoutLoading) {
            context.read<LoadingCubit>().hideLoading();
          }
          if (state is LogoutSuccess) {
            SnackBarManager.showSuccessSnackBar(context, Strings.loggedOut);
          } else if (state is LogoutFailure) {
            SnackBarManager.showFailureSnackBar(context, state.failure.message);
          } else if (state is LogoutLoading) {
            context.read<LoadingCubit>().showLoading();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Muhammad Elsayed Task'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(Sizes.s16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: Sizes.s200,
                    child: Center(
                      child: BlocBuilder<FetchUserCubit, FetchUserState>(
                        builder: (context, state) {
                          if (state is FetchUserSuccess) {
                            return Text(
                              'Hi ${state.userEntity.name}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: AppTheme.grey),
                            );
                          } else if (state is FetchUserFailure) {
                            return Text(
                              state.failure.message,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: AppTheme.grey),
                            );
                          }
                          return const CircularProgressIndicator.adaptive();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: Sizes.s16),
                  Text(
                    'I hope that you like the way I build the project! 😎',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: Sizes.s64),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        context.read<LogoutCubit>().logout();
                      },
                      label: const Text(Strings.logout),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
