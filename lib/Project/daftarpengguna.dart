import 'package:flutter/material.dart';
import 'package:latihan_flutter_dasar/Project/formLogin.dart';
import 'package:latihan_flutter_dasar/database/databasehelper.dart';
import 'package:latihan_flutter_dasar/database/preferences_handler.dart';
import 'package:latihan_flutter_dasar/extension/extension.dart';
import 'package:latihan_flutter_dasar/models/user_model_sql.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UserList> {
  void _refreshList() {
    setState(() {});
  }

  void isLogout() async {
    await PreferencesHandler.logOut();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Formlogin()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<UserModelSql>>(
              future: DBHelper().getAllUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Terjadi kesalahan: ${snapshot.error}'),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Tidak ada data pengguna.'));
                }

                final daftarPengguna = snapshot.data!;

                return ListView.builder(
                  itemCount: daftarPengguna.length,
                  itemBuilder: (context, index) {
                    final user = daftarPengguna[index];
                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.person)),
                        title: Text(user.nama ?? '-'),
                        subtitle: Text(user.email),
                        // subtitle: Text('Password: ${user.password}'),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.edit_document,
                            color: Colors.blueGrey,
                          ),
                          onPressed: () {
                            _showBottomSheet(context, user);
                          },
                        ),

                        onTap: () {
                          _showBottomSheet(context, user);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),

          ElevatedButton(
            onPressed: () async {
              await PreferencesHandler.logOut();
              context.pushAndRemoveAll(const Formlogin());
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, UserModelSql user) {
    final emailController = TextEditingController(text: user.email);
    final passwordController = TextEditingController(text: user.password);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Kelola Pengguna',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (user.id != null) {
                        final updatedUser = UserModelSql(
                          id: user.id,
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );

                        bool success = await DBHelper().updateUser(updatedUser);

                        if (success && context.mounted) {
                          Navigator.pop(context);
                          _refreshList();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data berhasil diperbarui'),
                            ),
                          );
                        }
                      }
                    },
                  ),

                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    icon: const Icon(Icons.delete, color: Colors.white),
                    label: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (user.id != null) {
                        await DBHelper().deleteUser(user.id!);

                        if (context.mounted) {
                          Navigator.pop(context);
                          _refreshList();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data berhasil dihapus'),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
