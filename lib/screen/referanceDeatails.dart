import 'package:creditsea/components/simpleAppbar.dart';
import 'package:creditsea/components/stepProgressBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ReferenceAndFamilyDetailsScreen extends StatefulWidget {
  const ReferenceAndFamilyDetailsScreen({super.key});

  @override
  State<ReferenceAndFamilyDetailsScreen> createState() =>
      _ReferenceAndFamilyDetailsScreenState();
}

class _ReferenceAndFamilyDetailsScreenState
    extends State<ReferenceAndFamilyDetailsScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _referenceNameController =
      TextEditingController();
  final TextEditingController _referenceMobileController =
      TextEditingController();

  final TextEditingController _family1NameController = TextEditingController();
  final TextEditingController _family1MobileController =
      TextEditingController();
  String? _family1Relation;

  final TextEditingController _family2NameController = TextEditingController();
  final TextEditingController _family2MobileController =
      TextEditingController();
  String? _family2Relation;

  int _currentTab = 0;

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() => _currentTab = 1);
  }

  void _showReviewModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please re-confirm the reference details",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Text(
              "Name",
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
            ),
            Text(
              _referenceNameController.text,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Text(
              "Mobile number",
              style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
            ),
            Text(
              '+91 ${_referenceMobileController.text}',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Edit details"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _goToNextPage();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      "Yes, proceed",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabBar() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                "Reference Details",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: _currentTab == 0 ? 1 : 0,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                "Family Details",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: _currentTab == 1 ? 1 : 0,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CreditSeaSimple(),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: height * 0.08,
                width: width * 0.9,
                child: StepProgressBar(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: buildTabBar(),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [buildReferenceForm(), buildFamilyForm()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReferenceForm() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A few trusted contacts & you're good to go!",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "We'll only reach out if absolutely necessary",
                  style: GoogleFonts.poppins(fontSize: 13),
                ),
                const SizedBox(height: 30),
                Text(
                  "Name of Reference",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _referenceNameController,
                  decoration: InputDecoration(
                    hintText: "e.g. Arjun Mehta",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Mobile Number",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _referenceMobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixText: '+91  ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ), 
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.lock_outline_rounded,
                    size: 16,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Only used for ID verification or emergencies. Never for marketing. Your privacy is safe with us.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    if (_referenceNameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please Enter your Name')),
                      );
                    } else if (_referenceMobileController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please Enter your Contact Number'),
                        ),
                      );
                    } else if (_referenceNameController.text.isNotEmpty &&
                        _referenceMobileController.text.length == 10) {
                      _showReviewModal();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please Enter a valid 10-digit Contact Number',
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }

  void _showFamilyReviewModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please re-confirm the family details",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              for (int i = 0; i < 2; i++) ...[
                Text(
                  "Family Member Details ${i + 1}",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              const SizedBox(height: 5),
                Text(
                  "Relationship",
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
                ),
                Text(
                  i == 0
                      ? _family1Relation ?? "Not selected"
                      : _family2Relation ?? "Not selected",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  "Name",
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
                ),
                Text(
                  i == 0
                      ? _family1NameController.text
                      : _family2NameController.text,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  "Mobile number",
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
                ),
                Text(
                  '+91 ${i == 0 ? _family1MobileController.text : _family2MobileController.text}',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
              ],
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Edit details"),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Details submitted successfully!'),
                          ),
                        );
                          Get.toNamed('/loanprocessing');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                       shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                      ),
                      child: const Text(
                        "Yes, proceed",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildFamilyForm() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          "A few trusted contacts & you're good to go!",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          "We'll only reach out if absolutely necessary",
          style: GoogleFonts.poppins(fontSize: 13),
        ),
        const SizedBox(height: 30),
        ...List.generate(2, (index) {
          final nameController = index == 0
              ? _family1NameController
              : _family2NameController;
          final mobileController = index == 0
              ? _family1MobileController
              : _family2MobileController;
          final relation = index == 0 ? _family1Relation : _family2Relation;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Family Member Details ${index + 1}",
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10,),
                Text("Relationship" , style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: relation,
                onChanged: (value) {
                  setState(() {
                    if (index == 0)
                      _family1Relation = value;
                    else
                      _family2Relation = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: ["Father", "Mother", "Spouse", "Sibling"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                hint: const Text("Select"),
              ),
              const SizedBox(height: 10),
              Text("Name", style: GoogleFonts.poppins(
                fontSize:14 ,
                fontWeight: FontWeight.w500
              )),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "e.g. Rina Mehta",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
               Text(
                "Mobile Number",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixText: '+91  ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        }),

        const SizedBox(height: 16),
        SizedBox(
          height: 48,
          child: ElevatedButton(
           onPressed: () {
              if ((_family1Relation != null ||
                  _family2Relation != null) &&
                  (_family1NameController.text.isNotEmpty ||
                  _family2NameController.text.isNotEmpty) &&
                  (_family1MobileController.text.length == 10 &&
                  _family2MobileController.text.length == 10)) {
                _showFamilyReviewModal();
              } 
              else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please fill all fields correctly"),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ), ), 
            child: const Text(
              "Submit Details",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
