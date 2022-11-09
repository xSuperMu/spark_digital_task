import 'package:spark_digital/imports.dart';

class YearPickerInput extends StatefulWidget {
  final Function(int) onYearSelected;

  const YearPickerInput({Key? key, required this.onYearSelected})
      : super(key: key);

  @override
  State<YearPickerInput> createState() => _YearPickerInputState();
}

class _YearPickerInputState extends State<YearPickerInput> {
  late final TextEditingController _yearCtrl;

  @override
  void initState() {
    super.initState();
    _yearCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _yearCtrl.dispose();
    super.dispose();
  }

  void _showYearPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext builder) {
          return Material(
            color: Colors.transparent,
            child: Container(
              height: context.height * 0.5,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.s16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Sizes.s28),
                  Text(
                    Strings.yearOfBirth,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: AppTheme.purple),
                  ),
                  Expanded(
                    child: BlocProvider(
                      create: (context) => getItInstance<DateCubit>(),
                      child: BlocBuilder<DateCubit, DateTime>(
                        builder: (context, selectedDate) {
                          return YearPicker(
                            firstDate: DateTime(DateTime.now().year - 100, 1),
                            lastDate: DateTime(DateTime.now().year, 1),
                            initialDate: DateTime.now(),
                            selectedDate: selectedDate,
                            onChanged: (DateTime dateTime) {
                              widget.onYearSelected(dateTime.year);
                              context.read<DateCubit>().setDate(dateTime);
                              _yearCtrl.text = dateTime.year.toString();
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showYearPicker(context),
      child: CustomInputField(
        controller: _yearCtrl,
        label: Strings.yearOfBirth,
        enabled: false,
        suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
        validator: (value) {
          if (value.isNullOrEmpty) {
            return Strings.requiredField;
          }
          return null;
        },
      ),
    );
  }
}
