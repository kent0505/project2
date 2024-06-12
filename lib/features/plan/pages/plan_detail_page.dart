import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/appbar/custom_appbar.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../bloc/plan_bloc.dart';
import '../models/plan.dart';

class PlanDetailPage extends StatelessWidget {
  const PlanDetailPage({super.key, required this.plan});

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Aaa',
            onPressed: () {
              context.pop();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                PrimaryButton(
                  title: 'Delete',
                  onPressed: () {
                    context.read<PlanBloc>().add(DeletePlanEvent(id: plan.id));
                    context.pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
