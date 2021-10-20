import 'package:equatable/equatable.dart';

abstract class GetDataEvent extends Equatable {
  const GetDataEvent();
}

class GetDataOnButtonPressed extends GetDataEvent {
  const GetDataOnButtonPressed();
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
