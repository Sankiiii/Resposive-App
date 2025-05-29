import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'l10n/app_localizations.dart';

class JobSelectionPage extends StatefulWidget {
  final dynamic userDetails;

  const JobSelectionPage({super.key, required this.userDetails});

  @override
  _JobSelectionPageState createState() => _JobSelectionPageState();
}

class _JobSelectionPageState extends State<JobSelectionPage> {
  String? selectedJob;
  late Map<String, String> jobMap;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final loc = AppLocalizations.of(context)!;

    jobMap = {
      loc.jobBabySitter: 'BabySitter',
      loc.jobCook: 'Cook',
      loc.jobHelper: 'Helper',
      loc.jobDriver: 'Driver',
      loc.jobPatientCareTaker: 'PatientCareTaker',
      loc.jobDeliveryPerson: 'DeliveryPerson',
    };
  }

  Future<void> sendData(List<String> userDetails) async {
    CollectionReference users = FirebaseFirestore.instance.collection('userdetails');

    try {
      await users.add({
        'name': userDetails[1],
        'phone': userDetails[2],
        'age': userDetails[3],
        'gender': userDetails[4],
        'state': userDetails[5],
        'job': userDetails[6],
        'lang': userDetails[0],
        'timestamp': FieldValue.serverTimestamp(),
      });

      print("✅ Data submitted successfully");
    } catch (e) {
      print("❌ Error submitting data: $e");
    }
  }

  Future<void> sendEmailJS({
    required String name,
    required String phone,
    required String job,
    required List<String> userDetails
  }) async {
    const serviceId = 'service_fw627wt';
    const templateId = 'template_a6hab6b';
    const userId = 'iEAVuq8o0W_bqG5oi';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'name': userDetails[1],
          'phone': userDetails[2],
          'age': userDetails[3],
          'gender': userDetails[4],
          'state': userDetails[5],
          'job': userDetails[6],
          'lang': userDetails[0],
          'message': 'New user registration and job selection',
          'time': DateTime.now().toString(), // or use your own format
        },
      }),
    );

    if (response.statusCode == 200) {
      print('✅ Email sent!');
    } else {
      print('❌ Failed to send email: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.selectJob)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.whichJob, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedJob,
              items: jobMap.keys
                  .map((job) => DropdownMenuItem(value: job, child: Text(job)))
                  .toList(),
              onChanged: (value) => setState(() => selectedJob = value),
              decoration: InputDecoration(
                hintText: loc.selectJobType,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: selectedJob != null
                    ? () async {
                        List<String> updatedUserDetails = List.from(widget.userDetails);
                        final englishJob = jobMap[selectedJob!]!;
                        updatedUserDetails.add(englishJob);

                        await sendData(updatedUserDetails);
                        await sendEmailJS(
                          name: updatedUserDetails[1],
                          phone: updatedUserDetails[2],
                          job: englishJob,
                          userDetails: updatedUserDetails
                        );

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(loc.submitted),
                            content: Text(loc.jobConfirmation),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                                child: Text(loc.ok),
                              )
                            ],
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey,
                ),
                child: Text(loc.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
