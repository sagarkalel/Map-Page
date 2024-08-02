import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_page/blocs/main_page_bloc/main_page_bloc.dart';
import 'package:map_page/utils/constants.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.items,
    required this.hintText,
    required this.selectedValue,
    required this.onChanged,
  });

  final List<String> items;
  final String hintText;
  final String? selectedValue;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) {
        return SizedBox(
          height: 48,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
                value: selectedValue,
                buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Theme.of(context).hintColor),
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: getScreenY(context) * .3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                hint: Text(
                  hintText,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).hintColor.withOpacity(0.25)),
                ),
                onChanged: onChanged,
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()),
          ),
        );
      },
    );
  }
}
