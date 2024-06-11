import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/appbar/custom_appbar.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../bloc/plan_bloc.dart';
import '../models/plan_model.dart';

class PlanDetailPage extends StatelessWidget {
  const PlanDetailPage({super.key, required this.planModel});

  final PlanModel planModel;

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
                    context
                        .read<PlanBloc>()
                        .add(DeletePlanEvent(id: planModel.id));
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
