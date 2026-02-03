import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("General", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 10),

          SwitchListTile(
            title: const Text("Push Notifications"),
            secondary: const Icon(Icons.notifications_active, color: Colors.orange),
            value: _notificationsEnabled,
            activeColor: const Color(0xFF2962FF),
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text("Dark Mode"),
            secondary: const Icon(Icons.dark_mode, color: Colors.purple),
            value: _darkModeEnabled,
            activeColor: const Color(0xFF2962FF),
            onChanged: (bool value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
          ),

          const Divider(height: 40),
          const Text("Account", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 10),

          ListTile(
            leading: const Icon(Icons.lock, color: Colors.blue),
            title: const Text("Change Password"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Log Out"),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Cancel")),
                      TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Logout", style: TextStyle(color: Colors.red))),
                    ],
                  )
              );
            },
          ),
        ],
      ),
    );
  }
}