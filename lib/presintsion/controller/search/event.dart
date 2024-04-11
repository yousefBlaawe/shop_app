abstract class SearchEvent {}
class SearchDataEvent extends SearchEvent{
  final String Data;
  SearchDataEvent({required this.Data});
}