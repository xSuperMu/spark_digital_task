import 'package:spark_digital/imports.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late final TextEditingController _emailCtrl;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getItInstance<ForgetPasswordCubit>(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is! ForgetPasswordLoading) {
            context.read<LoadingCubit>().hideLoading();
          }
          if (state is ForgetPasswordSuccess) {
            Navigator.pop(context);
            SnackBarManager.showSuccessSnackBar(context, Strings.checkYourMail);
          } else if (state is ForgetPasswordFailure) {
            SnackBarManager.showFailureSnackBar(context, state.failure.message);
          } else if (state is ForgetPasswordLoading) {
            context.read<LoadingCubit>().showLoading();
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(Sizes.s20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Sizes.s72),
                    Text(
                      Strings.forgetPassword,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: AppTheme.purple),
                    ),
                    const SizedBox(height: Sizes.s24),
                    Text(
                      Strings.forgetPasswordDescription,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppTheme.black),
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
                    const SizedBox(height: Sizes.s32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<ForgetPasswordCubit>()
                                .sendResetPasswordEmail(_emailCtrl.text);
                          }
                        },
                        child: const Text(Strings.continueKeyword),
                      ),
                    ),
                    const SizedBox(height: Sizes.s32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(Strings.cancel),
                      ),
                    ),
                    const SizedBox(height: Sizes.s8),
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
