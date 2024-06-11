import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/appbar/custom_appbar.dart';
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
        ],
      ),
    );
  }
}
