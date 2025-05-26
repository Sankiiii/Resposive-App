import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'l10n/app_localizations.dart';
import 'job_selection_page.dart';

class StateSelectionPage extends StatefulWidget {
  final List<String> userDetails; // Updated from dynamic to List<String>

  const StateSelectionPage({super.key, required this.userDetails});

  @override
  _StateSelectionPageState createState() => _StateSelectionPageState();
}

class _StateSelectionPageState extends State<StateSelectionPage> {
  String? selectedState;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final List<String> localizedStates = [
      loc.state_AndhraPradesh,
      loc.state_ArunachalPradesh,
      loc.state_Assam,
      loc.state_Bihar,
      loc.state_Chhattisgarh,
      loc.state_Delhi,
      loc.state_Goa,
      loc.state_Gujarat,
      loc.state_Haryana,
      loc.state_HimachalPradesh,
      loc.state_Jharkhand,
      loc.state_Karnataka,
      loc.state_Kerala,
      loc.state_MadhyaPradesh,
      loc.state_Maharashtra,
      loc.state_Manipur,
      loc.state_Meghalaya,
      loc.state_Mizoram,
      loc.state_Nagaland,
      loc.state_Odisha,
      loc.state_Punjab,
      loc.state_Rajasthan,
      loc.state_Sikkim,
      loc.state_TamilNadu,
      loc.state_Telangana,
      loc.state_Tripura,
      loc.state_UttarPradesh,
      loc.state_Uttarakhand,
      loc.state_WestBengal,
    ];

    return Scaffold(
      appBar: AppBar(title: Text(loc.selectState)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.fromWhichState, style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            DropdownSearch<String>(
              items: localizedStates,
              popupProps: PopupProps.menu(showSearchBox: true),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  hintText: loc.selectYourState,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              onChanged: (value) => setState(() => selectedState = value),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: selectedState != null
                    ? () {
                        List<String> updatedUserDetails = List.from(widget.userDetails);
                        updatedUserDetails.add(selectedState!); // append state
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobSelectionPage(userDetails: updatedUserDetails),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey,
                ),
                child: Text(loc.next),
              ),
            )
          ],
        ),
      ),
    );
  }
}
