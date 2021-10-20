import 'dart:convert';
import 'package:api_bloc_project/state.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'model_class.dart';
import 'event.dart';
import 'state.dart';

class DataBloc extends Bloc<GetDataEvent, GetDataState> {
  DataBloc(initialState) : super(initialState);
  GetDataState get initialState => GetDataInitial();

  Stream<GetDataState> mapEventoState(GetDataEvent event) async* {
    if (event is GetDataOnButtonPressed) {
      try {
        yield GetDataProgress();
        // ignore: unused_local_variable
        final List<Post> postData = await fetData();

        yield GetDataSuccess(postData: postData);
      } catch (e) {
        yield GetDataFailed();
      }
    }
  }

  Future<List<Post>> fetData() async {
    final List<Post> allPost = [];
    Response response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    List<dynamic> responseData = jsonDecode(response.body);
    responseData.forEach((singleData) {
      allPost.add(Post(
          body: singleData['body'],
          title: singleData['title'],
          id: singleData['id'],
          userId: singleData['userId']));
    });
    return allPost;
  }
}
