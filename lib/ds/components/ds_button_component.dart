import 'package:book_list/ds/ds.dart';
import 'package:flutter/material.dart';

class DsButtonComponent extends StatelessWidget {
  final String textButton;
  final bool? hasIcon;
  final VoidCallback onPressed;
  final bool hasButtonColor;

  const DsButtonComponent({super.key, required this.textButton, required this.onPressed, this.hasIcon, this.hasButtonColor = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing.spacing2XL.width),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: InkWell(
              onTap: onPressed,
              child: Container(
                decoration: BoxDecoration(color: hasButtonColor ? context.colors.blue.dark : null, borderRadius: BorderRadius.circular(context.spacing.spacingMD.width)),
                padding: EdgeInsets.symmetric(horizontal: context.spacing.spacingXL.width, vertical: context.spacing.spacingLG.height),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: context.spacing.spacingXS.width,
                  children: [
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          textButton,
                          style: context.fontStyle.bodyLarge.copyWith(color: hasButtonColor ? context.colors.neutral.white : context.colors.neutral.deepOcean, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
