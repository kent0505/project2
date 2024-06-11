import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/utils.dart';
import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/picker/time_picker.dart';
import '../../../../core/widgets/textfields/date_field.dart';
import '../../../../core/widgets/textfields/num_field.dart';
import '../../../../core/widgets/textfields/txt_field.dart';
import '../../bloc/plan_bloc.dart';
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

  String pickedTime = '';

  void showTimePicker(TextEditingController controller) {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return TimePicker(
          time: controller.text,
          date: true,
          onSave: () {
            setState(() {
              controller.text = pickedTime;
            });
            context.pop();
          },
          onDateTimeChanged: (newTime) {
            pickedTime = formatDate(newTime);
          },
        );
      },
    );
  }

  void onCreate() {
    context.read<PlanBloc>().add(
          AddPlanEvent(
            plan: PlanModel(
              id: widget.planModel.id,
              name: widget.planModel.name,
              departureTime: widget.planModel.departureTime,
              arrivalTime: widget.planModel.arrivalTime,
              from: controller1.text,
              to: controller2.text,
              date: controller3.text,
              passenger: int.tryParse(controller4.text) ?? 1,
              price: int.tryParse(controller4.text) ?? 0,
            ),
          ),
        );
    context.go('/home');
  }

  @override
  void initState() {
    super.initState();
    controller3.text = getCurrentDate();
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
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 24),
                _FieldCard(
                  controller: controller1,
                  title: 'From',
                ),
                const SizedBox(height: 14),
                _FieldCard(
                  controller: controller2,
                  title: 'To',
                ),
                const SizedBox(height: 14),
                _FieldCard(
                  controller: controller3,
                  title: 'Date',
                  onTap: () {
                    showTimePicker(controller3);
                  },
                ),
                const SizedBox(height: 14),
                _FieldCard(
                  controller: controller4,
                  title: 'Passenger',
                ),
                const SizedBox(height: 14),
                _FieldCard(
                  controller: controller5,
                  title: 'Price/Hotel',
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      title: 'Create',
                      width: 250,
                      onPressed: onCreate,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldCard extends StatelessWidget {
  const _FieldCard({
    required this.controller,
    required this.title,
    this.onTap,
  });

  final TextEditingController controller;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.grey8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.grey40,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 7),
          if (title == 'Date')
            DateField(
              controller: controller,
              onTap: onTap,
            )
          else if (title == 'Passenger' || title == 'Price/Hotel')
            NumField(controller: controller)
          else
            TxtField(controller: controller),
        ],
      ),
    );
  }
}
