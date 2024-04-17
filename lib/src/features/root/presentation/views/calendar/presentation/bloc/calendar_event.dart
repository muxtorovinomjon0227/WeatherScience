part of 'calendar_bloc.dart';

@immutable
sealed class CalendarEvent extends Equatable{}

class FetchCalendarDataEvent extends CalendarEvent {
  final String q;
  final String units;
  final BuildContext context;
  FetchCalendarDataEvent({required this.context, required this.q,required this.units});
  @override
  List<Object?> get props => [q,units,context];
}
