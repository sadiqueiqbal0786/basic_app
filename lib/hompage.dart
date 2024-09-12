import 'package:basic_app/controller/user_list_controller.dart';
import 'package:basic_app/model/user_model.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> data = [];
  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future<void> getdata() async {
    final response = await UserListController.getUserList();
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User List'),
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(data[index].avatar.toString()),
                title: Row(
                  children: [
                    Text('${data[index].firstName}'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${data[index].lastName}'),
                  ],
                ),
                subtitle: Text(data[index].email.toString()),
                trailing: Text("${data[index].id}"),
              );
            }));
  }
}
