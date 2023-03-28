import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required this.hintText,
    required this.selectedDate,
    required this.onDateSelected,
  });
  final String hintText;
  final DateTime? selectedDate;
  final void Function(DateTime) onDateSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (date != null) {
          onDateSelected(date);
        }
      },
      child: Container(
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: IAIColor.whiteColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: IAIColor.tabBarInactive,
              spreadRadius: -10,
              blurRadius: 20,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate == null
                  ? hintText
                  : '${selectedDate!.toLocal()}'.split(' ')[0],
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: IAIColor.subTitle,
              ),
            ),
            const Icon(
              Icons.calendar_month_outlined,
              color: IAIColor.deepBlue,
            ),
          ],
        ),
      ),
    );
  }
}
