import 'package:flutter/material.dart';

//fstless ->import es material
class CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context){
    return ChoiceChip(
      label: Text(label), 
      selected: selected, 
      onSelected: (_){
        onTap();
      },
    );
  }
}