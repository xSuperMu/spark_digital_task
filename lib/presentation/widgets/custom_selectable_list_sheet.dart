import 'package:spark_digital/imports.dart';

class CustomSelectableListSheet extends StatelessWidget {
  final String label;
  final ListItemEntity? selectedItem;
  final List<ListItemEntity> dataList;
  final Function(ListItemEntity) onItemSelected;

  const CustomSelectableListSheet({
    Key? key,
    required this.label,
    this.selectedItem,
    this.dataList = const [],
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (dataList.isNotEmpty) _openSelectableListSheet(context);
      },
      child: CustomInputField(
        key: Key(selectedItem?.name ?? ''),
        label: label,
        enabled: false,
        initialValue: selectedItem?.name,
        border: CustomInputBorder.outlineBorder,
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

  void _openSelectableListSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: context.height * 0.4,
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.s32,
            horizontal: Sizes.s20,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: AppTheme.purple),
              ),
              const SizedBox(height: Sizes.s8),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, i) {
                    return RadioListTile<ListItemEntity>(
                      value: dataList[i],
                      groupValue: selectedItem,
                      onChanged: (value) {
                        onItemSelected(value!);
                        Navigator.pop(context);
                      },
                      title: Text(
                        dataList[i].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      activeColor: AppTheme.purple,
                      visualDensity: VisualDensity.compact,
                    );
                  },
                  separatorBuilder: (context, i) =>
                      const Divider(height: Sizes.s0),
                  itemCount: dataList.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
