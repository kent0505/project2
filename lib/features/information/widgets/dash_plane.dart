import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashPlane extends StatelessWidget {
  const DashPlane({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 19,
      width: 189,
      child: Stack(
        children: [
          Positioned(
            bottom: 8,
            child: SvgPicture.asset('assets/icons/dash.svg'),
          ),
          Positioned(
            right: 82,
            child: SvgPicture.asset('assets/icons/plane.svg'),
          ),
        ],
      ),
    );
  }
}
