import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'services/email_service.dart';  // <-- import your email service

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

  Future<void> sendData(List<String> userDetails) async {
    CollectionReference users = FirebaseFirestore.instance.collection('userdetails');

    try {
      await users.add({
        'name': userDetails[1],
        'phone': userDetails[2],
        'age': userDetails[3],
        'gender': userDetails[4],
        'state': userDetails[5],
        'job': userDetails[6], // English job
        'lang': userDetails[0],
        'timestamp': FieldValue.serverTimestamp(),
      });

      print("✅ Data submitted successfully");
    } catch (e) {
      print("❌ Error submitting data: $e");
      throw e; // rethrow so we can catch it in UI logic
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
            Text(
              loc.whichJob,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
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
                        final englishJob = jobMap[selectedJob!];
                        updatedUserDetails.add(englishJob!);
                        print(updatedUserDetails);

                        try {
                          await sendData(updatedUserDetails);

                          // Send email with user details
                          await EmailService.sendJobApplicationEmail(
                            name: updatedUserDetails[1],
                            phone: updatedUserDetails[2],
                            age: updatedUserDetails[3],
                            gender: updatedUserDetails[4],
                            state: updatedUserDetails[5],
                            job: updatedUserDetails[6],
                          );

                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(loc.submitted),
                              content: Text(loc.jobConfirmation),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.popUntil(context, (route) => route.isFirst),
                                  child: Text(loc.ok),
                                )
                              ],
                            ),
                          );
                        } catch (e) {
                          print("❌ Error submitting or sending email: $e");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(loc.submit)),
                          );
                        }
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
