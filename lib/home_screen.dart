import 'package:api_bloc_project/event.dart';
import 'package:api_bloc_project/model_class.dart';
import 'package:api_bloc_project/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DataBloc getBloc = DataBloc(GetDataInitial());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("api project"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: BlocBuilder<DataBloc, GetDataState>(
                bloc: getBloc,
                builder: (context, state) {
                  if (state is GetDataProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is GetDataSuccess) {
                    return _buildListView(state.postData);
                  }
                  if (state is GetDataFailed) {
                    return const Center(
                      child: Text("error"),
                    );
                  }
                  return Container();
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  getBloc.add(const GetDataOnButtonPressed());
                },
                child: const Text("Button"))
          ],
        )));
  }

  ListView _buildListView(List<Post> postData) {
    return ListView.builder(
        itemCount: postData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(postData[index].title),
            subtitle: Text(postData[index].body),
            leading: CircleAvatar(
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Text(postData[index].id.toString())),
            ),
          );
        });
  }
}
