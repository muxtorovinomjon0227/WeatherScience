part of 'current_day_bloc.dart';

@immutable
sealed class CurrentDayEvent extends Equatable{}

class FetchDataEvent extends CurrentDayEvent{
  final String q;
  final String units;
  final BuildContext context;
  FetchDataEvent({required this.context, required this.q,required this.units});
  @override
  List<Object?> get props => [q,units,context];
}
class UpdateDataEvent extends CurrentDayEvent{
  final String q;
  final String units;
  final BuildContext context;
  UpdateDataEvent({required this.context, required this.q,required this.units});
  @override
  List<Object?> get props => [q,units,context];
}
