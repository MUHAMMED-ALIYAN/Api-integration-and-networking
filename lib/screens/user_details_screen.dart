import 'package:flutter/material.dart';
import 'package:my_app/models/user_models.dart';


class UserDetailScreen extends StatelessWidget {
  final User user;
  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final profilePic = "https://i.pravatar.cc/150?img=${user.id}";

    return Scaffold(
      appBar: AppBar(title: const Text("User Profile"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(radius: 60, backgroundImage: NetworkImage(profilePic)),
            const SizedBox(height: 20),
            Text(user.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(user.email, style: TextStyle(color: Colors.grey[600], fontSize: 16)),
            const SizedBox(height: 8),
            Text("@${user.username}", style: const TextStyle(color: Colors.deepPurple)),
            const SizedBox(height: 30),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildInfoRow(Icons.person, "Name", user.name),
                    const Divider(),
                    _buildInfoRow(Icons.email, "Email", user.email),
                    const Divider(),
                    _buildInfoRow(Icons.account_circle, "Username", user.username),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.deepPurple.shade50,
          child: Icon(icon, color: Colors.deepPurple),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        )
      ],
    );
  }
}
