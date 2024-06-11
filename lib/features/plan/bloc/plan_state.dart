part of 'plan_bloc.dart';

abstract class PlanState {}

class PlanInitial extends PlanState {}

class PlansLoadedState extends PlanState {
  final List<PlanModel> plans;
  PlansLoadedState({required this.plans});
}
