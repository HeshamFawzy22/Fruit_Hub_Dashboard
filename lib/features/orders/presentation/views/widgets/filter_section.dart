import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.filter_alt_outlined, size: 30.0, color: Colors.grey[600],),
        const SizedBox(width: 16.0),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'ابحث عن طلب',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
          ),
        ),
      ],
    );
  }
}