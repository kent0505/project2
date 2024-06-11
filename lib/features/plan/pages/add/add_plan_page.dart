import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../models/plan_model.dart';

class AddPlanPage extends StatefulWidget {
  const AddPlanPage({super.key, required this.planModel});

  final PlanModel planModel;

  @override
  State<AddPlanPage> createState() => _AddPlanPageState();
}

class _AddPlanPageState extends State<AddPlanPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();

  void onCreate() {
    // context.push(
    //   '/add-plan',
    //   extra: PlanModel(
    //     id: widget.planModel.id,
    //     name: widget.planModel.name,
    //     departureTime: widget.planModel.departureTime,
    //     arrivalTime: widget.planModel.arrivalTime,
    //     from: controller1.text,
    //     to: controller2.text,
    //     date: controller3.text,
    //     passenger: controller4.text,
    //     price: int.tryParse(controller5.text) ?? 0,
    //   ),
    // );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Plan',
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
