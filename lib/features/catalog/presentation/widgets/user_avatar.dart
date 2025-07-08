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
      backgroundImage: avatarUrl != null ? AssetImage(avatarUrl!) : null,
      backgroundColor: avatarUrl == null ? _getAvatarColor(userName) : null,
      child: avatarUrl == null && userName.isNotEmpty
          ? Text(
              userName.isNotEmpty ? userName[0].toUpperCase() : '',
              style: TextStyle(
                fontSize: radius * 0.6,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
    );
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
