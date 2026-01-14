import 'package:book_list/ds/ds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DsErrorDialog extends StatelessWidget {
  final String titleButton;
  final String? errorMessage;
  final VoidCallback? onTap;
  final bool retry;
  final VoidCallback? onTapRetry;

  const DsErrorDialog({super.key, this.retry = false, this.onTapRetry, required this.titleButton, required this.errorMessage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipPath(
            clipper: CurvedHeaderClipper(),
            child: Container(
              height: context.spacing.spacing11XL.height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.colors.blue.silver,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
              ),
              child: Icon(CupertinoIcons.exclamationmark_octagon, size: context.spacing.spacing7XL.width, color: context.colors.blue.dark),
            ),
          ),
          SizedBox(height: context.spacing.spacingLG.height),
          Text('Ops!', style: context.fontStyle.titleLarge),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spacing.spacing3XL.width),
            child: Column(
              children: [
                Text(errorMessage ?? '', textAlign: TextAlign.center, style: context.fontStyle.bodyLarge),
                SizedBox(height: context.spacing.spacing5XL.height),
              ],
            ),
          ),

          if (retry == true && onTapRetry != null)
            Column(
              children: [
                SizedBox(height: context.spacing.spacingXL.height),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.spacing.spacingLG.width),
                  child: DsButtonComponent(textButton: 'Tentar novamente', hasIcon: false, onPressed: onTapRetry!),
                ),
              ],
            ),

          if (!retry)
            Column(
              children: [
                SizedBox(height: context.spacing.spacingLG.height),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.spacing.spacingLG.width),
                  child: DsButtonComponent(textButton: titleButton, hasIcon: false, hasButtonColor: !retry, onPressed: onTap ?? context.pop),
                ),
              ],
            ),

          SizedBox(height: context.spacing.spacing3XL.height),
        ],
      ),
    );
  }
}

class CurvedHeaderClipper extends CustomClipper<Path> {
  CurvedHeaderClipper();

  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 20);

    path.quadraticBezierTo(
      size.width / 2,
      size.height + 20, // ponto de controle para curva suave
      size.width,
      size.height - 20,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
