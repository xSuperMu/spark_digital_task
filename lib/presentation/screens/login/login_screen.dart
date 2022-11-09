import 'package:spark_digital/imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailCtrl;
  late final TextEditingController _passwordCtrl;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getItInstance<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is! LoginLoading) {
            context.read<LoadingCubit>().hideLoading();
          }
          if (state is LoginSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRouter.initial, (route) => false);
          } else if (state is LoginFailure) {
            SnackBarManager.showFailureSnackBar(context, state.failure.message);
          } else if (state is LoginLoading) {
            context.read<LoadingCubit>().showLoading();
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(Sizes.s32),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Sizes.s72),
                    Text(
                      Strings.login,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: AppTheme.purple),
                    ),
                    const SizedBox(height: Sizes.s32),
                    CustomInputField(
                      controller: _emailCtrl,
                      label: Strings.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isNullOrEmpty) {
                          return Strings.requiredField;
                        }
                        if (!value.isValidEmail) {
                          return Strings.emailValidation;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: Sizes.s16),
                    BlocProvider(
                      create: (context) => getItInstance<PasswordCubit>(),
                      child: BlocBuilder<PasswordCubit, bool>(
                        builder: (context, obscureText) {
                          return CustomInputField(
                            controller: _passwordCtrl,
                            label: Strings.password,
                            obscureText: obscureText,
                            suffixIcon: IconButton(
                              onPressed: () {
                                context.read<PasswordCubit>().togglePassword();
                              },
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: obscureText
                                    ? AppTheme.mediumGrey
                                    : AppTheme.purple,
                              ),
                            ),
                            validator: (value) {
                              if (value.isNullOrEmpty) {
                                return Strings.requiredField;
                              }
                              if (value!.length <
                                  AppConstants.maxPasswordLength) {
                                return Strings.passwordValidation;
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: Sizes.s32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                                  email: _emailCtrl.text,
                                  password: _passwordCtrl.text,
                                );
                          }
                        },
                        child: const Text(Strings.letsGo),
                      ),
                    ),
                    const SizedBox(height: Sizes.s8),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.forgotPassword);
                      },
                      child: const Text(Strings.forgetYourPassword),
                    ),
                    const SizedBox(height: Sizes.s56),
                    Text(
                      Strings.doNotHaveAnAccountRegisterNow,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppTheme.purple,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: Sizes.s16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(Strings.register),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ).clearFocus(context);
  }
}
