import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String? avatarUrl;
  final String userName;
  final double radius;

  const UserAvatar({
    super.key,
    required this.avatarUrl,
    required this.userName,
    this.radius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: avatarUrl != null && avatarUrl!.isNotEmpty
          ? NetworkImage(avatarUrl!)
          : null,
      backgroundColor: avatarUrl == null || avatarUrl!.isEmpty
          ? _getAvatarColor(userName)
          : null,
      child: _buildAvatarContent(),
    );
  }

  Widget? _buildAvatarContent() {
    if (avatarUrl == null || avatarUrl!.isEmpty) {
      return userName.isNotEmpty
          ? Text(
              userName[0].toUpperCase(),
              style: TextStyle(
                fontSize: radius * 0.6,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          : Icon(Icons.person, size: radius * 0.8);
    }
    return null;
  }

  Color _getAvatarColor(String userId) {
    final colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];

    return colors[userId.hashCode % colors.length];
  }
}
