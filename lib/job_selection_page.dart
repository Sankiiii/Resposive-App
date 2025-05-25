import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';  

class JobSelectionPage extends StatefulWidget {
  @override
  _JobSelectionPageState createState() => _JobSelectionPageState();
}

class _JobSelectionPageState extends State<JobSelectionPage> {
  String? selectedJob;

  final List<String> jobKeys = [
    'job_BabySitter',
    'job_Cook',
    'job_Helper',
    'job_Driver',
    'job_PatientCareTaker',
    'job_DeliveryPerson'
  ];

  
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;  // get localization instance
    final localizedJobs = jobKeys.map((key) {
      switch (key) {
        case 'job_BabySitter':
          return loc.jobBabySitter;
        case 'job_Cook':
          return loc.jobCook;
        case 'job_Helper':
          return loc.jobHelper;
        case 'job_Driver':
          return loc.jobDriver;
        case 'job_PatientCareTaker':
          return loc.jobPatientCareTaker;
        case 'job_DeliveryPerson':
          return loc.jobDeliveryPerson;
        default:
          return key;
      }
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(loc.selectJob)),  // localized string

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.whichJob,  // localized string
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: selectedJob,
              items: localizedJobs.map((job) => DropdownMenuItem(value: job, child: Text(job))).toList(),
              onChanged: (value) => setState(() => selectedJob = value),
              decoration: InputDecoration(
                hintText: loc.selectJobType,  // localized string
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
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(loc.submitted),  // localized string
                            content: Text(loc.jobConfirmation),  // localized string
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                                child: Text(loc.ok),  // localized string
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
                child: Text(loc.submit ?? 'submit'), 
              ),
            )
          ],
        ),
      ),
    );
  }
}
