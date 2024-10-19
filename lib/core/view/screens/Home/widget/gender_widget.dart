import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatelessWidget {
  final String? genderText;
  final bool? selected;
  final VoidCallback? onSelected;
  final String? imgLik;

  const GenderWidget(
      {super.key,
      this.genderText,
      this.selected,
      this.onSelected,
      required this.imgLik});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChoiceChip3D(
        style: ChoiceChip3DStyle(
            backColor: theme.colorScheme.surface,

            borderRadius: BorderRadius.circular(
              8,
            ),
            topColor:selected ??false? theme.colorScheme.onSurface.withOpacity(.03):Colors.transparent),
        border: Border.all(color: theme.colorScheme.onSurface.withOpacity(.2)),
        selected: selected ?? false,
        onSelected: onSelected ?? () {},
        onUnSelected: () {},
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            Image.asset(
              imgLik ?? "",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            Text(
              genderText ?? "",
              style: theme.textTheme.bodyLarge,
            )
          ],
        ));
  }
}
