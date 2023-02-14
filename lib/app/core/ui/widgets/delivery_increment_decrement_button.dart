// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  const DeliveryIncrementDecrementButton({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = false;

  const DeliveryIncrementDecrementButton.compact({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  }) : _compact = true;

  final bool _compact;
  final int amount;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _compact ? const EdgeInsets.all(10) : null,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: decrementTap,
              child: Icon(Icons.remove,
                  size: _compact ? 17 : 22, color: context.colors.secondary),
            ),
          ),
          Text(
            amount.toString(),
            style: context.textStyles.textRegular.copyWith(
                fontSize: _compact ? 13 : 17, color: context.colors.secondary),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: incrementTap,
              child: Icon(Icons.add,
                  size: _compact ? 17 : 22, color: context.colors.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
