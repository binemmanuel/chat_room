import 'package:flutter/material.dart';
import 'package:frontend/src/models/message.dart';
import 'package:frontend/src/utils/palette.dart';
import 'package:ionicons/ionicons.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.message,
    this.isMine = false,
  });

  final Message message;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isMine
              ? Palette.backgroundColor.withOpacity(0.7)
              : Palette.backgroundColor.withOpacity(0.05),

          //
          borderRadius: BorderRadius.circular(5),
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Ionicons.person_circle,
                  color: isMine ? Colors.white : Palette.backgroundColor,
                ),

                const SizedBox(width: 5),

                // Sender name
                Text(
                  message.sender.username,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: isMine
                            ? Colors.white.withOpacity(0.8)
                            : Palette.backgroundColor.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                ),
              ],
            ),

            // The message
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Text(
                message.message,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isMine ? Colors.white : Palette.backgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
