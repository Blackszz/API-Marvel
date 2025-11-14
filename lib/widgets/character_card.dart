import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MarvelCharacterCard extends StatelessWidget {
  final String heroName;
  final String realName;
  final String nickname;
  final String imageUrl;
  final VoidCallback? onTap;

  const MarvelCharacterCard({
    super.key,
    required this.heroName,
    required this.realName,
    required this.nickname,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 320,
        height: 69,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1,
            color: AppTheme.borderGray,
          ),
        ),
        child: Row(
          children: [
            // Avatar
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            // Texts
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Name
                  Text(
                    heroName,
                    style: AppTheme.headlineText.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textWhite,
                    ),
                  ),

                  const SizedBox(height: 2),

                  // Real Name
                  Text(
                    realName,
                    style: AppTheme.bodyTextBold.copyWith(
                      fontSize: 12,
                      color: AppTheme.textLightGray,
                    ),
                  ),

                  const SizedBox(height: 2),

                  // Nickname
                  Text(
                    nickname,
                    style: AppTheme.bodyText.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textLightGray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}