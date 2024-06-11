part of 'plan_bloc.dart';

abstract class PlanEvent {}

class GetPlansEvent extends PlanEvent {}

class AddPlanEvent extends PlanEvent {
  final PlanModel plan;
  AddPlanEvent({required this.plan});
}

class EditPlanEvent extends PlanEvent {
  final PlanModel plan;
  EditPlanEvent({required this.plan});
}

class DeletePlanEvent extends PlanEvent {
  final int id;
  DeletePlanEvent({required this.id});
}
