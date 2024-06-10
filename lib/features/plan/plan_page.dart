import 'package:flutter/material.dart';

import '../../core/widgets/appbar/custom_appbar.dart';
import '../../core/widgets/buttons/primary_button.dart';
import 'widgets/plan_card.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(title: 'Planned trips'),
        Expanded(
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  SizedBox(height: 20),
                  PlanCard(),
                  SizedBox(height: 20),
                  PlanCard(),
                  SizedBox(height: 20),
                  PlanCard(),
                  SizedBox(height: 170),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: PrimaryButton(
                    title: '+ Add    ',
                    borderRadius: 32,
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
