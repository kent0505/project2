import 'package:flutter/material.dart';
import 'package:travel_test/core/config/app_colors.dart';

import '../../../../core/widgets/appbar/custom_appbar.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  final controller1 = TextEditingController();

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Create card'),
          Container(
            decoration: BoxDecoration(
              color: AppColors.grey8,
            ),
          ),
        ],
      ),
    );
  }
}
