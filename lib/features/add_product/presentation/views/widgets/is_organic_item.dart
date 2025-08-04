import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_check_box_widget.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class IsOrganicItem extends StatefulWidget {
  const IsOrganicItem({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<IsOrganicItem> createState() => _IsOrganicItemState();
}

class _IsOrganicItemState extends State<IsOrganicItem> {
  @override

  /// The width of the text is calculated based on the width of the screen
  /// minus the padding of the parent widget, minus the width of the checkbox
  /// (which is 48), minus the padding of the row (which is [kHorizontalPadding]
  /// on each side).
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Checkbox(value: false, onChanged: (value) {}),
        CustomCheckBoxWidget(
          onChanged: widget.onChanged,
        ),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Text(
            'هل هو منتج عضوى؟',
            style: TextStyles.semiBold13.copyWith(
              color: AppColors.lightPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
