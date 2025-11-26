import 'package:flutter/material.dart';
import '../models/superhero.dart';
import '../screens/character_page.dart';
import '../theme/app_theme.dart';

class CharacterCard extends StatelessWidget {
  final SuperHero hero;

  const CharacterCard({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CharacterPage(hero: hero)),
        );
      },
      child: Card(
        color: t.cardTheme.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppTheme.primaryRed, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  hero.imageUrl ?? '',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  hero.name,
                  style: t.textTheme.bodyLarge?.copyWith(
                    color: AppTheme.textWhite,
                    fontSize: 18,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: AppTheme.textLightGray),
            ],
          ),
        ),
      ),
    );
  }
}