import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/utils.dart';
import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/picker/time_picker.dart';
import '../../../../core/widgets/textfields/time_field.dart';
import '../../models/plan_model.dart';

class AddTimePage extends StatefulWidget {
  const AddTimePage({super.key, required this.name});

  final String name;

  @override
  State<AddTimePage> createState() => _AddTimePageState();
}

class _AddTimePageState extends State<AddTimePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  String pickedTime = '';

  void showTimePicker(TextEditingController controller) {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return TimePicker(
          time: controller.text,
          onSave: () {
            setState(() {
              controller.text = pickedTime;
            });
            context.pop();
          },
          onDateTimeChanged: (newTime) {
            pickedTime = formatTime(newTime);
          },
        );
      },
    );
  }

  void onNext() {
    context.push(
      '/add-plan',
      extra: PlanModel(
        id: getCurrentTimestamp(),
        name: widget.name,
        departureTime: controller1.text,
        arrivalTime: controller2.text,
        from: '',
        to: '',
        date: '',
        passenger: 0,
        price: 0,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller1.text = getCurrentTime();
    controller2.text = getCurrentTime();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Time',
            onPressed: () {
              context.pop();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  height: 144,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.grey8,
                  ),
                  child: Column(
                    children: [
                      TimeField(
                        controller: controller1,
                        suffixText: 'departure time',
                        onTap: () {
                          showTimePicker(controller1);
                        },
                      ),
                      const Spacer(),
                      TimeField(
                        controller: controller2,
                        suffixText: 'arrival time',
                        onTap: () {
                          showTimePicker(controller2);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 38),
                PrimaryButton(
                  title: 'Next',
                  width: 250,
                  onPressed: onNext,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
