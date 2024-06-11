import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../information/widgets/dash_plane.dart';
import '../models/plan_model.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({super.key, required this.planModel});

  final PlanModel planModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blue50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                child: Column(
                  children: [
                    Text(
                      'UZB',
                      style: TextStyle(
                        color: AppColors.grey60,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      planModel.from,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              const DashPlane(width: 128, right: 54),
              const SizedBox(width: 16),
              SizedBox(
                width: 60,
                child: Column(
                  children: [
                    Text(
                      'USA',
                      style: TextStyle(
                        color: AppColors.grey60,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      planModel.from,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            '${formatDateForCard(planModel.date)} | ${planModel.passenger} Seat',
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
          _BlackCard(planModel: planModel),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _BlackCard extends StatelessWidget {
  const _BlackCard({
    required this.planModel,
  });

  final PlanModel planModel;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.push('/plan-detail', extra: planModel);
      },
      padding: EdgeInsets.zero,
      child: Container(
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset('assets/icons/pin.svg'),
                      const SizedBox(height: 4),
                      const Text(
                        'UZB', // CHANGE
                        style: TextStyle(
                          color: AppColors.purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        planModel.from,
                        style: const TextStyle(
                          color: Color(0xff9698A9),
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        planModel.departureTime,
                        style: const TextStyle(
                          color: Color(0xff9698A9),
                          fontSize: 8,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 16.5,
                        width: 155,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 8,
                              child: SvgPicture.asset('assets/icons/dash.svg'),
                            ),
                            Positioned(
                              right: 72,
                              child: SvgPicture.asset(
                                'assets/icons/plane.svg',
                                height: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Flight Duration',
                        style: TextStyle(
                          color: AppColors.purple,
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        '3h 40m', // CHANGE
                        style: TextStyle(
                          color: Color(0xff9698A9),
                          fontSize: 8,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/pin.svg',
                        color: const Color(0xff0EC3AE),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'USA', // CHANGE
                        style: TextStyle(
                          color: AppColors.purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        planModel.to,
                        style: const TextStyle(
                          color: Color(0xff9698A9),
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        planModel.arrivalTime,
                        style: const TextStyle(
                          color: Color(0xff9698A9),
                          fontSize: 8,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 32,
                  width: 16,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    color: AppColors.blue50,
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      '- — — — — — — — — — — — — -',
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: AppColors.purple,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 32,
                  width: 16,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    color: AppColors.blue50,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 25,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  const Text(
                    'Price',
                    style: TextStyle(
                      color: Color(0xff1F1449),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${planModel.price}\$',
                    style: const TextStyle(
                      color: Color(0xff5C40CC),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
