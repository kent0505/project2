import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/appbar/custom_appbar.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../models/plan_model.dart';
import '../widgets/plan_card.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(title: 'Planned trips'),
        Expanded(
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(height: 20),
                  PlanCard(
                    planModel: PlanModel(
                      id: 1,
                      name: 'Aaa',
                      departureTime: '12:10',
                      arrivalTime: '22:06',
                      from: 'Tashkent',
                      to: 'New-York',
                      date: '22.06.2024',
                      passenger: 1,
                      price: 1000,
                    ),
                  ),
                  // SizedBox(height: 20),
                  // PlanCard(),
                  // SizedBox(height: 20),
                  // PlanCard(),
                  const SizedBox(height: 170),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 45,
                    left: 25,
                    right: 25,
                  ),
                  child: PrimaryButton(
                    title: '+ Add    ',
                    borderRadius: 32,
                    onPressed: () {
                      context.push('/add-name');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 65),
      ],
    );
  }
}
