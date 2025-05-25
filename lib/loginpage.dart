import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';
import 'state_selection_page.dart';

class UserFormPage extends StatefulWidget {
  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedGender;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(local.loginDetails),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(local.enterDetails, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 32),
                _buildTextField(local.name, _nameController, TextInputType.name),
                SizedBox(height: 16),
                _buildTextField(local.contactNumber, _phoneController, TextInputType.phone),
                SizedBox(height: 16),
                _buildTextField(local.age, _ageController, TextInputType.number),
                SizedBox(height: 16),
                _buildGenderDropdown(local),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StateSelectionPage()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey,
                  ),
                  child: Text(local.next),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, [TextInputType type = TextInputType.text]) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '${AppLocalizations.of(context)!.pleaseEnter} $label';
        }
        if (label == AppLocalizations.of(context)!.name && !RegExp(r'^[A-Za-z ]{1,20}$').hasMatch(value.trim())) {
          return AppLocalizations.of(context)!.invalidName;
        }
        if (label == AppLocalizations.of(context)!.contactNumber && !RegExp(r'^\d{10}$').hasMatch(value.trim())) {
          return AppLocalizations.of(context)!.invalidPhone;
        }
        if (label == AppLocalizations.of(context)!.age) {
          final age = int.tryParse(value.trim());
          if (age == null || age < 10 || age > 100) {
            return AppLocalizations.of(context)!.invalidAge;
          }
        }
        return null;
      },
    );
  }

  Widget _buildGenderDropdown(AppLocalizations local) {
    return DropdownButtonFormField<String>(
      value: _selectedGender,
      items: [
        DropdownMenuItem(value: local.genderMale, child: Text(local.genderMale)),
        DropdownMenuItem(value: local.genderFemale, child: Text(local.genderFemale)),
        DropdownMenuItem(value: local.genderOther, child: Text(local.genderOther)),
      ],
      onChanged: (val) => setState(() => _selectedGender = val),
      decoration: InputDecoration(
        hintText: local.selectGender,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      ),
      validator: (value) => value == null ? local.pleaseSelectGender : null,
    );
  }
}
