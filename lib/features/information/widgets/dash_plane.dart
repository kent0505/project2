import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashPlane extends StatelessWidget {
  const DashPlane({
    super.key,
    this.width = 189,
    this.right = 82,
  });

  final double width;
  final double right;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 19,
      width: width,
      child: Stack(
        children: [
          Positioned(
            bottom: 8,
            child: SvgPicture.asset('assets/icons/dash.svg'),
          ),
          Positioned(
            right: right,
            child: SvgPicture.asset('assets/icons/plane.svg'),
          ),
        ],
      ),
    );
  }
}
