import 'package:flutter/material.dart';
import 'loginpage.dart';

class LanguageSelectionScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const LanguageSelectionScreen({Key? key, required this.onLocaleChange}) : super(key: key);

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage;

  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'en'},
    {'name': 'हिन्दी', 'code': 'hi'},
    {'name': 'বাংলা', 'code': 'bn'},
    {'name': 'తెలుగు', 'code': 'te'},
    {'name': 'मराठी', 'code': 'mr'},
    {'name': 'தமிழ்', 'code': 'ta'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please select your language:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  final isSelected = selectedLanguage == language['code'];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: isSelected ? 4 : 1,
                    color: isSelected ? Colors.blue.withOpacity(0.1) : null,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      title: Text(
                        language['name']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle, color: Colors.blue)
                          : const Icon(Icons.circle_outlined),
                      onTap: () {
                        setState(() {
                          selectedLanguage = language['code'];
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: selectedLanguage != null
                    ? () {
                        // Update app locale when user taps Next
                        widget.onLocaleChange(Locale(selectedLanguage!));

                        // Navigate to next page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserFormPage()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey,
                ),
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
