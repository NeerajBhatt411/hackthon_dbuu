import 'package:flutter/material.dart';
import 'package:untitled2/controller/signup_controller.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    SignupController controller = SignupController();
    return Scaffold(
      appBar: AppBar(title: Text(("usersScreen")),),
      body:FutureBuilder(
          future: controller.fetchUsers()

          , builder:(context, snapshot) {
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }

            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final user  = snapshot.data![index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    trailing: Text(user.id),
                  );
                },
            );


          }, )
    );
  }
}
