import 'package:flutter/material.dart';
import 'package:wts_task/core/widgets/custom_cached_image.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    required this.avatarUrl,
    required this.userName,
    super.key,
    this.radius = 20,
  });

  final String? avatarUrl;
  final String userName;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final hasAvatar = avatarUrl != null && avatarUrl!.isNotEmpty;

    return ClipOval(
      child: Container(
        width: radius * 2,
        height: radius * 2,
        color: hasAvatar ? null : _getAvatarColor(userName),
        child: hasAvatar
            ? CustomCachedImage(
                imageUrl: avatarUrl!,
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
              )
            : Center(
                child: userName.isNotEmpty
                    ? Text(
                        userName[0].toUpperCase(),
                        style: TextStyle(
                          fontSize: radius * 0.6,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Icon(Icons.person, size: radius * 0.8),
              ),
      ),
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
