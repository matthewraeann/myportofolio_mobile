/// Menyimpan data satu pengalaman (kerja, organisasi, atau kepanitiaan)
/// yang ditampilkan pada bagian Pengalaman di portofolio.
class Experience {
  const Experience({
    required this.position,
    required this.organization,
    required this.startDate,
    required this.endDate,
    required this.description,
    this.link,
  });

  final String position;
  final String organization;
  final DateTime startDate;
  final DateTime endDate;
  final String description;

  /// Tautan pendukung (misalnya sertifikat atau situs organisasi); opsional.
  final String? link;
}
