import 'package:api_bloc_project/model_class.dart';
import 'package:equatable/equatable.dart';

abstract class GetDataState extends Equatable {
  const GetDataState();
}

class GetDataInitial extends GetDataState {
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetDataProgress extends GetDataState {
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetDataSuccess extends GetDataState {
    List<Post> postData = [];
  GetDataSuccess({required this.postData});

  @override
  List<Object?> get props => [postData];
}

class GetDataFailed extends GetDataState {
  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
