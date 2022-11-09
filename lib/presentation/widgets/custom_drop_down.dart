import 'package:spark_digital/imports.dart';

class CustomDropDown extends StatelessWidget {
  final List<ListItemEntity> dataList;
  final void Function(ListItemEntity item)? onChange;
  final ListItemEntity? selectedItem;
  final String? hint;
  final bool showCheckmark;

  const CustomDropDown({
    Key? key,
    required this.dataList,
    this.onChange,
    this.selectedItem,
    this.hint,
    this.showCheckmark = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.s28,
        // vertical: Sizes.s4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.s50),
        border: Border.all(color: AppTheme.mediumGrey),
        // color: AppTheme.lightGrey,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<ListItemEntity>(
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          hint: selectedItem == null
              ? Text(
                  hint ?? '',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppTheme.grey,
                        fontWeight: FontWeight.bold,
                      ),
                )
              : Text(
                  selectedItem!.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
          items: dataList.map((item) {
            return DropdownMenuItem<ListItemEntity>(
              alignment: AlignmentDirectional.centerStart,
              value: item,
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(height: 1.5),
                      ),
                    ),
                    if (showCheckmark && selectedItem?.id == item.id)
                      const Icon(Icons.check),
                  ],
                ),
              ),
            );
          }).toList(),
          onChanged: (item) {
            if (item != selectedItem && item != null) {
              onChange?.call(item);
            }
          },
          isExpanded: true,
        ),
      ),
    );
  }
}
