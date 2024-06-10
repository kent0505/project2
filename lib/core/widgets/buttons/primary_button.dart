import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.icon,
    this.svg = '',
    this.borderRadius = 16,
    required this.onPressed,
  });

  final String title;
  final IconData? icon;
  final String svg;
  final double borderRadius;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: AppColors.white,
                ),
                const SizedBox(width: 4),
              ],
              if (svg.isNotEmpty) ...[
                SvgPicture.asset('assets/icons/$svg.svg'),
                const SizedBox(width: 4),
              ],
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
