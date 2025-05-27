import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JobSelectionPage extends StatefulWidget {
  final dynamic userDetails;

  const JobSelectionPage({super.key, required this.userDetails});

  @override
  _JobSelectionPageState createState() => _JobSelectionPageState();
}

class _JobSelectionPageState extends State<JobSelectionPage> {
  String? selectedJob;

  late Map<String, String> jobMap; // localized display -> English name

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final loc = AppLocalizations.of(context)!;

    // Map localized job titles to English values
    jobMap = {
      loc.jobBabySitter: 'BabySitter',
      loc.jobCook: 'Cook',
      loc.jobHelper: 'Helper',
      loc.jobDriver: 'Driver',
      loc.jobPatientCareTaker: 'PatientCareTaker',
      loc.jobDeliveryPerson: 'DeliveryPerson',
    };
  }

  void sendData(List<String> userDetails) async {
    CollectionReference users = FirebaseFirestore.instance.collection('userdetails');

    try {
      await users.add({
        'name': userDetails[1],
        'phone': userDetails[2],
        'age': userDetails[3],
        'gender': userDetails[4],
        'state': userDetails[5],
        'job': userDetails[6], // now this is in English
        'lang': userDetails[0],
        'timestamp': FieldValue.serverTimestamp(),
      });

      print("✅ Data submitted successfully");
    } catch (e) {
      print("❌ Error submitting data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.selectJob)), // localized string
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.whichJob, // localized string
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: selectedJob,
              items: jobMap.keys
                  .map((job) => DropdownMenuItem(
                        value: job,
                        child: Text(job),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => selectedJob = value),
              decoration: InputDecoration(
                hintText: loc.selectJobType, // localized string
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: selectedJob != null
                    ? () {
                        List<String> updatedUserDetails = List.from(widget.userDetails);
                        final englishJob = jobMap[selectedJob!]; // get English version
                        updatedUserDetails.add(englishJob!);
                        print(updatedUserDetails);
                        sendData(updatedUserDetails);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(loc.submitted), // localized string
                            content: Text(loc.jobConfirmation), // localized string
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                                child: Text(loc.ok), // localized string
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
