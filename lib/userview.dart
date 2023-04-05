import 'package:del/add_edit.dart';
import 'package:del/services/user_service.dart';
import 'package:flutter/material.dart';
import 'model/user_model.dart';
import 'provider/change_theme_widget.dart';

class Userview extends StatefulWidget {
  const Userview({Key? key}) : super(key: key);

  @override
  State<Userview> createState() => _UserviewState();
}

class _UserviewState extends State<Userview> {
  List<UserModel>? userList;

  bool loading = true;

  getAllUser() async {
    userList = await UserService().getUser();
    setState(() {
      loading = false;
      getAllUser();
    });
  }

  delete(UserModel userModel) async {
    await UserService().deleteUser(userModel);
    setState(() {
      loading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Deleted!"),
        duration: Duration(milliseconds: 1000),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text("Records from DataBase: ${userList?.length} "),
        actions: const [ChangeThemeWidget()],
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(strokeWidth: 1),
            )
          : ListView.builder(
              itemCount: userList?.length,
              itemBuilder: (context, index) {
                UserModel user = userList![index];
                return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEdit(
                            userModel: user,
                            index: index,
                          ),
                        ),
                      ).then((value) => getAllUser());
                    },
                    leading: CircleAvatar(child: Text(user.name[0])),
                    title: Text(user.name),
                    subtitle: Row(
                      children: [
                        Text(user.city),
                        const SizedBox(width: 8),
                        Text(user.phone)
                      ],
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                        onPressed: () {
                          delete(user);
                        },
                        icon: const Icon(Icons.delete)));
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const AddEdit()))
              .then((value) => getAllUser());
        },
        tooltip: 'Add New Record',
        icon: const Icon(Icons.add),
        label: const Text('Add Record'),
      ),
    );
  }
}
