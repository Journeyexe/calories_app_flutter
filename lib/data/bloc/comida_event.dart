abstract class ComidaEvent {}

class GetComida extends ComidaEvent {
  final String keyWord;
  GetComida({required this.keyWord});
}