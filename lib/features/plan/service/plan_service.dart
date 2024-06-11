import 'package:hive_flutter/hive_flutter.dart';

import '../models/plan_model.dart';

class PlanService {
  PlanService() {
    Hive.registerAdapter(PlanAdapter());
  }

  List<PlanModel> plans = [];

  Future<List<PlanModel>> getPlans() async {
    final box = await Hive.openBox('travelbox');
    List plans2 = box.get('plans') ?? [];
    plans = plans2.cast<PlanModel>();
    return plans;
  }

  Future<List<PlanModel>> updatePlans() async {
    final box = await Hive.openBox('travelbox');
    box.put('plans', plans);
    plans = await box.get('plans');
    return plans;
  }
}
