import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/profile");
                    },
                    child: const CircleAvatar(
                      radius: 48, // Image radius
                      backgroundImage: AssetImage("assets/images/avatar.png"),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Mohamed Nageh Younes",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )),
          ListTile(
            title: const Text("Home"),
            trailing: const Icon(Icons.account_box),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            trailing: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            trailing: const Icon(Icons.language),
            title: const Text("Language"),
            onTap: () {
              Navigator.pushNamed(context, '/language');
            },
          ),
          ListTile(
            trailing: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
