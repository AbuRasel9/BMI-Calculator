import 'package:flutter/material.dart';

class AgeWeightWidget extends StatefulWidget {
  final String title;

  final VoidCallback increment;
  final VoidCallback decrement;
  final int value;

  const AgeWeightWidget(
      {super.key,
      required this.title,

      required this.increment,
      required this.decrement,
      required this.value});

  @override
  State<AgeWeightWidget> createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom:
        10,
        top: 5,
        left: 10,
        right: 10
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8,
          ),
          border:
              Border.all(color: theme.colorScheme.onSurface.withOpacity(.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: widget.decrement,
                  child: const CircleAvatar(
                    radius: 14,
                    child: Icon(
                      Icons.remove,
                      size: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  widget.value.toString(),
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: widget.increment,
                  child: const CircleAvatar(
                    radius: 14,
                    child: Icon(
                      Icons.add,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
