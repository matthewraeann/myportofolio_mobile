import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/project.dart';

/// Menampilkan seluruh atribut satu proyek dari API.
class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.projectImageUrl.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  project.projectImageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 48),
                ),
              ),
              const SizedBox(height: 16),
            ],
            Text(project.title, style: textTheme.headlineSmall),
            const SizedBox(height: 16),
            Text('Description', style: textTheme.titleMedium),
            Text(project.description),
            const SizedBox(height: 16),
            Text('Tech Stack', style: textTheme.titleMedium),
            Text(project.techStack),
            const SizedBox(height: 16),
            Text('Project URL', style: textTheme.titleMedium),
            SelectableText(project.projectUrl),
          ],
        ),
      ),
    );
  }
}
