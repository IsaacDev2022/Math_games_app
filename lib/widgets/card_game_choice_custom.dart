import 'package:flutter/material.dart';
import 'package:math_games_app/widgets/button_custom.dart';

class CardGameChoiceCustom extends StatelessWidget {
  final IconData icon;
  final String textCard;
  final VoidCallback onPressed;

  const CardGameChoiceCustom({
    super.key,
    required this.icon,
    required this.textCard,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 170,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFF6CA91),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Text(
                  textCard,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0x98272020)
                  ),
                ),
                const SizedBox(height: 20),
                ButtonCustom(
                    heightButton: 50,
                    widthButton: 100,
                    textButton: "Iniciar",
                    onPressed: () {
                      onPressed;
                    },
                    color: Color(0xFFFF7F00)
                )
              ],
            ),
          ),
          Positioned(
            top: -30,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFFFF7F00),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
