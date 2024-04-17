part of 'current_day_bloc.dart';

@immutable
sealed class CurrentDayState extends Equatable{}

 class CurrentDayInitialState extends CurrentDayState {
  @override
  List<Object?> get props => [];
}
 class FetchedDataState extends CurrentDayState {
  final CurrentDayModel currentDayModel;
  FetchedDataState({required this.currentDayModel});
  @override
  List<Object?> get props => [currentDayModel];
}
