import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'l10n/app_localizations.dart';
import 'job_selection_page.dart';

class StateSelectionPage extends StatefulWidget {
  final List<String> userDetails; // Expecting language at index 0

  const StateSelectionPage({super.key, required this.userDetails});

  @override
  _StateSelectionPageState createState() => _StateSelectionPageState();
}

class _StateSelectionPageState extends State<StateSelectionPage> {
  String? selectedStateLocalized;

  late Map<String, String> stateMap; // Localized name -> English name

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final loc = AppLocalizations.of(context)!;

    // Localized → English state map
    stateMap = {
      loc.state_AndhraPradesh: 'Andhra Pradesh',
      loc.state_ArunachalPradesh: 'Arunachal Pradesh',
      loc.state_Assam: 'Assam',
      loc.state_Bihar: 'Bihar',
      loc.state_Chhattisgarh: 'Chhattisgarh',
      loc.state_Delhi: 'Delhi',
      loc.state_Goa: 'Goa',
      loc.state_Gujarat: 'Gujarat',
      loc.state_Haryana: 'Haryana',
      loc.state_HimachalPradesh: 'Himachal Pradesh',
      loc.state_Jharkhand: 'Jharkhand',
      loc.state_Karnataka: 'Karnataka',
      loc.state_Kerala: 'Kerala',
      loc.state_MadhyaPradesh: 'Madhya Pradesh',
      loc.state_Maharashtra: 'Maharashtra',
      loc.state_Manipur: 'Manipur',
      loc.state_Meghalaya: 'Meghalaya',
      loc.state_Mizoram: 'Mizoram',
      loc.state_Nagaland: 'Nagaland',
      loc.state_Odisha: 'Odisha',
      loc.state_Punjab: 'Punjab',
      loc.state_Rajasthan: 'Rajasthan',
      loc.state_Sikkim: 'Sikkim',
      loc.state_TamilNadu: 'Tamil Nadu',
      loc.state_Telangana: 'Telangana',
      loc.state_Tripura: 'Tripura',
      loc.state_UttarPradesh: 'Uttar Pradesh',
      loc.state_Uttarakhand: 'Uttarakhand',
      loc.state_WestBengal: 'West Bengal',
    };
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final List<String> localizedStates = stateMap.keys.toList();

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
              onChanged: (value) => setState(() => selectedStateLocalized = value),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: selectedStateLocalized != null
                    ? () {
                        List<String> updatedUserDetails = List.from(widget.userDetails);
                        final englishState = stateMap[selectedStateLocalized!]!;
                        updatedUserDetails.add(englishState); // Append English state
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
