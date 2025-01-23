// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _usernameController;
  String? _avatarUrl;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    _usernameController =
        TextEditingController(text: userProvider.user?.username ?? '');
    _avatarUrl = userProvider.user?.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Avatar
            GestureDetector(
              onTap: () {
                // Implement avatar selection
              },
              child: CircleAvatar(
                radius: 60,
                backgroundImage: _avatarUrl != null
                    ? NetworkImage(_avatarUrl!)
                    : AssetImage('assets/images/avatars/avatar1.png')
                as ImageProvider,
              ),
            ),
            SizedBox(height: 20),
            // Username Field
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            // Save Button
            ElevatedButton.icon(
              onPressed: () {
                // Save updated profile
                String newUsername = _usernameController.text.trim();
                if (newUsername.isNotEmpty) {
                  User updatedUser = User(
                    username: newUsername,
                    avatarUrl: _avatarUrl ?? 'assets/images/avatars/avatar1.png',
                    totalScore: userProvider.user?.totalScore ?? 0,
                    earnedBadges: userProvider.user?.earnedBadges ?? [],
                  );
                  userProvider.saveUser(updatedUser);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Profile Updated')),
                  );
                }
              },
              icon: Icon(Icons.save),
              label: Text('Save'),
              style: ElevatedButton.styleFrom(
                padding:
                EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(height: 30),
            // Total Score
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Score:',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${userProvider.user?.totalScore ?? 0}',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Earned Badges Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/badges');
              },
              icon: Icon(Icons.star),
              label: Text('View Badges'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding:
                EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
