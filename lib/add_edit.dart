import 'package:del/services/user_service.dart';
import 'package:flutter/material.dart';

import 'model/user_model.dart';
import 'provider/change_theme_widget.dart';

class AddEdit extends StatefulWidget {
  final UserModel? userModel;
  final int? index;

  const AddEdit({Key? key, this.userModel, this.index}) : super(key: key);

  @override
  State<AddEdit> createState() => _AddEditState();
}

class _AddEditState extends State<AddEdit> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController city = TextEditingController();

  bool editItem = false;

  add(UserModel userModel) async {
    await UserService().addUser(userModel).then(
      (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Add Successful"),
            duration: Duration(milliseconds: 1000),
          ),
        );
        Navigator.pop(context);
        name.text = '';
        phone.text = '';
        gender.text = '';
        city.text = '';
      },
    );
  }

  updateUser(UserModel userModel) async {
    await UserService().updateUser(userModel).then(
      (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Updated Successful"),
            duration: Duration(milliseconds: 1000),
          ),
        );
        Navigator.pop(context);
        name.text = '';
        phone.text = '';
        gender.text = '';
        city.text = '';
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editItem = true;
      name.text = widget.userModel!.name;
      phone.text = widget.userModel!.phone;
      gender.text = widget.userModel!.gender;
      city.text = widget.userModel!.city;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [ChangeThemeWidget()],
        title: Text(editItem ? "Update" : 'Add'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: name,
              decoration: const InputDecoration(
                  hintText: 'Full Name', label: Text('Full Name')),
            ),
            TextField(
                keyboardType: TextInputType.number,
                controller: phone,
                decoration: const InputDecoration(
                    hintText: 'Phone Number', label: Text('Phone Number'))),
            TextField(
                controller: gender,
                decoration: const InputDecoration(
                    hintText: 'Gender', label: Text('Gender'))),
            TextField(
                controller: city,
                decoration: const InputDecoration(
                    hintText: 'city', label: Text('city'))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  if (editItem) {
                    UserModel userModel = UserModel(
                        id: widget.userModel!.id,
                        gender: gender.text,
                        name: name.text,
                        phone: phone.text,
                        city: city.text);
                    updateUser(userModel);
                  } else {
                    if (name.text.isEmpty ||
                        phone.text.isEmpty ||
                        gender.text.isEmpty ||
                        city.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("A field is empty!"),
                          duration: Duration(milliseconds: 1000),
                        ),
                      );
                    } else {
                      UserModel userModel = UserModel(
                          gender: gender.text,
                          name: name.text,
                          phone: phone.text,
                          city: city.text,
                          id: '');
                      add(userModel);
                    }
                  }
                },
                icon: const Icon(Icons.save),
                label: Text(editItem ? "Update" : "Save Record "),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
