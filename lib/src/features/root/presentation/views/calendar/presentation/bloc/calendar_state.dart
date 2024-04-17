part of 'calendar_bloc.dart';

@immutable
sealed class CalendarState extends Equatable{}

final class CalendarInitialState extends CalendarState {
  @override
  List<Object?> get props => [];
}
class FetchedDataState extends CalendarState {
  final MonthTempModel monthTempModel;
  FetchedDataState({required this.monthTempModel});
  @override
  List<Object?> get props => [monthTempModel];
}

class ExceptionState extends CalendarState{
  final String message;
  ExceptionState({required this.message});
  @override
  List<Object?> get props => [message];
}