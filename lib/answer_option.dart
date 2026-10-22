import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  const AnswerOption({
    Key? key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blueAccent : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black87,
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.blueAccent, width: 1.5),
          ),
          elevation: 2,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}


// yang baru 22/10/2026
import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  const AnswerOption({
    Key? key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blueAccent : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black87,
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.blueAccent, width: 1.5),
          ),
          elevation: 2,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
