import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

/// Halaman form untuk menambahkan proyek baru ke portofolio melalui API.
///
/// Field mengikuti `ProjectSerializer` pada backend Django (Tutorial 07).
class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _description = '';
  String _techStack = '';
  String _projectUrl = '';
  String _projectImageUrl = '';
  bool _isSubmitting = false;

  InputDecoration _decoration(String label, {String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint ?? label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
    );
  }

  String? _required(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return '$label tidak boleh kosong!';
    }
    return null;
  }

  bool _isHttpUrl(String text) {
    final uri = Uri.tryParse(text);
    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

  String? _validateUrl(String? value, String label, {bool optional = false}) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) {
      return optional ? null : '$label tidak boleh kosong!';
    }
    return _isHttpUrl(text)
        ? null
        : '$label harus berupa URL http/https yang valid!';
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    if (!await ensureLoggedIn(context)) return;
    if (!mounted) return;

    final auth = context.read<AuthState>();
    final token = auth.token;
    if (token == null) return;
    final apiClient = context.read<ApiClient>();
    final messenger = ScaffoldMessenger.of(context);

    setState(() {
      _isSubmitting = true;
    });

    try {
      final created = await apiClient.createProject(
        Project(
          title: _title.trim(),
          description: _description.trim(),
          techStack: _techStack.trim(),
          projectUrl: _projectUrl.trim(),
          projectImageUrl: _projectImageUrl.trim(),
        ),
        token: token,
      );
      if (!mounted) return;
      await _showSuccessDialog(created);
    } on ApiException catch (e) {
      if (e.statusCode == 401) {
        await auth.logout();
        messenger.showSnackBar(
          const SnackBar(content: Text('Sesi berakhir, silakan login ulang.')),
        );
        if (!mounted) return;
        if (await ensureLoggedIn(context)) {
          messenger.showSnackBar(
            const SnackBar(
                content: Text('Login berhasil, silakan simpan lagi.')),
          );
        }
      } else {
        messenger.showSnackBar(
          SnackBar(content: Text('Gagal menyimpan proyek (${e.statusCode}).')),
        );
      }
    } catch (_) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Tidak dapat terhubung ke server.')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  Future<void> _showSuccessDialog(Project project) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Proyek berhasil ditambahkan!'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Judul: ${project.title}'),
                Text('Deskripsi: ${project.description}'),
                Text('Tech Stack: ${project.techStack}'),
                Text('URL Proyek: ${project.projectUrl}'),
                Text(
                  'URL Gambar: ${project.projectImageUrl.isEmpty ? '-' : project.projectImageUrl}',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                _formKey.currentState!.reset();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Project Form'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: _decoration('Title'),
                  onChanged: (value) => _title = value,
                  validator: (value) => _required(value, 'Title'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: _decoration('Description'),
                  onChanged: (value) => _description = value,
                  validator: (value) => _required(value, 'Description'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: _decoration(
                    'Tech Stack',
                    hint: 'Contoh: Flutter, Django, Figma',
                  ),
                  onChanged: (value) => _techStack = value,
                  validator: (value) => _required(value, 'Tech Stack'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: _decoration(
                    'Project URL',
                    hint: 'https://contoh.com',
                  ),
                  onChanged: (value) => _projectUrl = value,
                  validator: (value) => _validateUrl(value, 'Project URL'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: _decoration(
                    'Project Image URL (Optional)',
                    hint: 'https://contoh.com/gambar.png',
                  ),
                  onChanged: (value) => _projectImageUrl = value,
                  validator: (value) => _validateUrl(
                    value,
                    'Project Image URL',
                    optional: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.indigo),
                  ),
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Simpan',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
