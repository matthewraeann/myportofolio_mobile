import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/models/project.dart';

void main() {
  group('Project', () {
    test('fromJson maps snake_case fields', () {
      final project = Project.fromJson({
        'id': '1',
        'title': 'Portfolio',
        'description': 'Desc',
        'tech_stack': 'Flutter',
        'project_url': 'https://example.com',
      });

      expect(project.id, '1');
      expect(project.techStack, 'Flutter');
      expect(project.projectImageUrl, '');
    });

    test('toJson omits id and uses snake_case keys', () {
      const project = Project(
        id: '1',
        title: 'Portfolio',
        description: 'Desc',
        techStack: 'Flutter',
        projectUrl: 'https://example.com',
      );

      final json = project.toJson();

      expect(json.containsKey('id'), isFalse);
      expect(json['tech_stack'], 'Flutter');
      expect(json['project_url'], 'https://example.com');
    });
  });
}
