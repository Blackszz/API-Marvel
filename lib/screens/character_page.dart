import 'package:app_wiki_marvel/service/api.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CharacterPage extends StatelessWidget {
    final HeroModel hero;
    const CharacterPage({Key? key, required this.hero}) : super(key: key);

    String fixImageUrl(String url) {
      return "https://corsproxy.io/?$url";
    }

    Widget _sectionTitle(BuildContext context, String text) {
        return Text(
            text,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.primaryRed,
                fontWeight: FontWeight.bold,
            ),
        );
    }

    Widget _infoLine(BuildContext context, String label, String value) {
        return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
                "$label: $value",
                style: Theme.of(context).textTheme.bodyMedium,
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        final t = Theme.of(context);
        return Scaffold(
            backgroundColor: t.colorScheme.background,
            appBar: AppBar(
                title: Text(
                    hero.name,
                    style: t.textTheme.titleLarge?.copyWith(color: AppTheme.textWhite),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
            ),
            body: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  fixImageUrl(hero.imageUrl),
                                  width: 260,
                                  height: 260,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => const Icon(Icons.error),
                                ),
                            ),
                        ),
                        const SizedBox(height: 20),
                        _sectionTitle(context, "Powerstats"),
                        const SizedBox(height: 6),
                        ...hero.powerstats.entries.map(
                            (e) => _infoLine(context, e.key, e.value),
                        ),
                        const SizedBox(height: 20),
                        _sectionTitle(context, "Appearance"),
                        const SizedBox(height: 6),
                        ...hero.appearance.entries.map(
                            (e) => _infoLine(context, e.key, e.value.toString()),
                        ),
                        const SizedBox(height: 20),
                        _sectionTitle(context, "Biography"),
                        const SizedBox(height: 6),
                        ...hero.biography.entries.map(
                            (e) => _infoLine(context, e.key, e.value.toString()),
                        ),
                    ],
                ),
            ),
        );
    }
}