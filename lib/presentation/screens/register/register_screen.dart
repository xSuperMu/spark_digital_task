import 'package:spark_digital/imports.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _passwordCtrl;
  late final TextEditingController _confirmPasswordCtrl;
  final _formKey = GlobalKey<FormState>();

  bool _agreeToTerms = true;

  int _selectedGender = 0;
  int _selectedYearOfBirth = DateTime.now().year;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController();
    _emailCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
    _confirmPasswordCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getItInstance<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is! RegisterLoading) {
            context.read<LoadingCubit>().hideLoading();
          }
          if (state is RegisterSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRouter.initial, (route) => false);
          } else if (state is RegisterFailure) {
            SnackBarManager.showFailureSnackBar(context, state.failure.message);
          } else if (state is RegisterLoading) {
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
                      Strings.letsBegin,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: AppTheme.purple),
                    ),
                    const SizedBox(height: Sizes.s32),
                    CustomInputField(
                      controller: _nameCtrl,
                      label: Strings.name,
                      validator: (value) {
                        if (value.isNullOrEmpty) {
                          return Strings.requiredField;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: Sizes.s16),
                    YearPickerInput(
                      onYearSelected: (year) {
                        _selectedYearOfBirth = year;
                      },
                    ),
                    const SizedBox(height: Sizes.s16),
                    BlocProvider(
                      create: (context) => getItInstance<GenderCubit>(),
                      child: BlocBuilder<GenderCubit, ListItemEntity?>(
                        builder: (context, selectedGender) {
                          return CustomSelectableListSheet(
                            label: Strings.gender,
                            selectedItem: selectedGender,
                            dataList: AppConstants.genders,
                            onItemSelected: (value) {
                              _selectedGender = value.id;
                              context.read<GenderCubit>().setGender(value);
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: Sizes.s16),
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
                    const SizedBox(height: Sizes.s16),
                    BlocProvider(
                      create: (context) => getItInstance<PasswordCubit>(),
                      child: BlocBuilder<PasswordCubit, bool>(
                        builder: (context, obscureText) {
                          return CustomInputField(
                            controller: _confirmPasswordCtrl,
                            label: Strings.confirmPassword,
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
                              if (value != _passwordCtrl.text) {
                                return Strings.unMatchingPasswords;
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: Sizes.s16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocProvider(
                          create: (context) => getItInstance<CheckBoxCubit>(),
                          child: BlocBuilder<CheckBoxCubit, bool>(
                            builder: (context, isChecked) {
                              return Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: isChecked,
                                activeColor: AppTheme.purple,
                                onChanged: (value) {
                                  _agreeToTerms = value!;
                                  context
                                      .read<CheckBoxCubit>()
                                      .toggleCheckBox();
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: Strings.iHaveReadThe,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: AppTheme.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: Strings.termsAndPrivacy,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: AppTheme.purple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                TextSpan(
                                  text: Strings.andIWantToProceed,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: AppTheme.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Sizes.s16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (!_agreeToTerms) {
                              return SnackBarManager.showFailureSnackBar(
                                  context, Strings.termsValidation);
                            }
                            final registerEntity = RegisterEntity(
                              name: _nameCtrl.text,
                              yearOfBirth: _selectedYearOfBirth,
                              gender: _selectedGender,
                              email: _emailCtrl.text,
                              password: _passwordCtrl.text,
                            );

                            context
                                .read<RegisterCubit>()
                                .register(registerEntity);
                          }
                        },
                        child: const Text(Strings.save),
                      ),
                    ),
                    const SizedBox(height: Sizes.s16),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: Strings.alreadyHaveProfile,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppTheme.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(
                            text: Strings.alreadyHaveProfileLogin,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppTheme.purple,
                                  fontWeight: FontWeight.bold,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, AppRouter.login);
                              },
                          ),
                        ],
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
