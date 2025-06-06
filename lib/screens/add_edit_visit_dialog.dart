import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class AddEditVisitDialog extends StatefulWidget {
  final Map<String, String>? visit;
  final int? index;
  final List<String> customerNames;
  final List<Map<String, String>> visits;
  final Function(Map<String, String>, int?) onSave;

  const AddEditVisitDialog({
    super.key,
    this.visit,
    this.index,
    required this.customerNames,
    required this.visits,
    required this.onSave,
  });

  @override
  _AddEditVisitDialogState createState() => _AddEditVisitDialogState();
}

class _AddEditVisitDialogState extends State<AddEditVisitDialog> {
  late TextEditingController customerNameController;
  late TextEditingController person1Controller;
  late TextEditingController person2Controller;
  late TextEditingController person3Controller;
  late TextEditingController person4Controller;
  late TextEditingController contactNumberController;
  late TextEditingController designationController;
  late TextEditingController requirementsController;
  late TextEditingController leadController;
  late TextEditingController discussionController;
  late TextEditingController demoGivenToController;
  late TextEditingController feedbackController;
  late TextEditingController trainingGivenToController;
  late TextEditingController remarksController;
  late TextEditingController equipmentController;
  late TextEditingController issueReportController;
  late TextEditingController reasonController;
  late TextEditingController amountController;
  late String? selectedVisitType;
  late String? selectedStatus;
  late String? selectedPaymentCollected;
  late DateTime? selectedCompletionDate;
  final formKey = GlobalKey<FormState>();
  final FocusNode customerNameFocusNode = FocusNode();

  final List<String> visitTypes = [
    'New',
    'Follow-up',
    'Demo',
    'Installation',
    'Service',
    'Payment',
    'Training',
  ];
  final List<String> statusOptions = ['Scheduled', 'In Progress', 'Completed', 'Cancelled'];

  bool showPerson1 = false;
  bool showPerson2 = false;
  bool showPerson3 = false;
  bool showPerson4 = false;
  bool showContactNumber = false;
  bool showDesignation = false;
  bool showRequirements = false;
  bool showLead = false;
  bool showDiscussion = false;
  bool showDemoGivenTo = false;
  bool showStatus = false;
  bool showCompletionDate = false;
  bool showFeedback = false;
  bool showTrainingGivenTo = false;
  bool showRemarks = false;
  bool showEquipment = false;
  bool showIssueReport = false;
  bool showReason = false;
  bool showPaymentCollected = false;
  bool showAmount = false;

  bool requirePerson1 = false;
  bool requireContactNumber = false;
  bool requireDesignation = false;
  bool requireLead = false;
  bool requireDemoGivenTo = false;
  bool requireStatus = false;
  bool requireCompletionDate = false;
  bool requireTrainingGivenTo = false;
  bool requireEquipment = false;
  bool requireIssueReport = false;
  bool requirePaymentCollected = false;
  bool requireAmount = false;

  @override
  void initState() {
    super.initState();
    customerNameController = TextEditingController(text: widget.visit?['name'] ?? '');
    person1Controller = TextEditingController(text: widget.visit?['person1']);
    person2Controller = TextEditingController(text: widget.visit?['person2']);
    person3Controller = TextEditingController(text: widget.visit?['person3']);
    person4Controller = TextEditingController(text: widget.visit?['person4']);
    contactNumberController = TextEditingController(text: widget.visit?['contactNumber']);
    designationController = TextEditingController(text: widget.visit?['designation']);
    requirementsController = TextEditingController(text: widget.visit?['requirements']);
    leadController = TextEditingController(text: widget.visit?['lead']);
    discussionController = TextEditingController(text: widget.visit?['discussion']);
    demoGivenToController = TextEditingController(text: widget.visit?['demoGivenTo']);
    feedbackController = TextEditingController(text: widget.visit?['feedback']);
    trainingGivenToController = TextEditingController(text: widget.visit?['trainingGivenTo']);
    remarksController = TextEditingController(text: widget.visit?['remarks']);
    equipmentController = TextEditingController(text: widget.visit?['equipment']);
    issueReportController = TextEditingController(text: widget.visit?['issueReport']);
    reasonController = TextEditingController(text: widget.visit?['reason']);
    amountController = TextEditingController(text: widget.visit?['amount']);
    selectedVisitType = widget.visit?['type'] ?? 'New';
    selectedStatus = widget.visit?['status'];
    selectedPaymentCollected = widget.visit?['paymentCollected'];
    selectedCompletionDate = widget.visit?['completionDate'] != null
        ? DateTime.parse(widget.visit!['completionDate']!)
        : null;
    updateFieldVisibility();
  }

  @override
  void dispose() {
    customerNameController.dispose();
    person1Controller.dispose();
    person2Controller.dispose();
    person3Controller.dispose();
    person4Controller.dispose();
    contactNumberController.dispose();
    designationController.dispose();
    requirementsController.dispose();
    leadController.dispose();
    discussionController.dispose();
    demoGivenToController.dispose();
    feedbackController.dispose();
    trainingGivenToController.dispose();
    remarksController.dispose();
    equipmentController.dispose();
    issueReportController.dispose();
    reasonController.dispose();
    amountController.dispose();
    customerNameFocusNode.dispose();
    super.dispose();
  }

  void updateFieldVisibility() {
    setState(() {
      showPerson1 = false;
      showPerson2 = false;
      showPerson3 = false;
      showPerson4 = false;
      showContactNumber = false;
      showDesignation = false;
      showRequirements = false;
      showLead = false;
      showDiscussion = false;
      showDemoGivenTo = false;
      showStatus = false;
      showCompletionDate = false;
      showFeedback = false;
      showTrainingGivenTo = false;
      showRemarks = false;
      showEquipment = false;
      showIssueReport = false;
      showReason = false;
      showPaymentCollected = false;
      showAmount = false;

      requirePerson1 = false;
      requireContactNumber = false;
      requireDesignation = false;
      requireLead = false;
      requireDemoGivenTo = false;
      requireStatus = false;
      requireCompletionDate = false;
      requireTrainingGivenTo = false;
      requireEquipment = false;
      requireIssueReport = false;
      requirePaymentCollected = false;
      requireAmount = false;

      if (selectedVisitType == 'New') {
        showPerson1 = true;
        showPerson2 = true;
        showPerson3 = true;
        showPerson4 = true;
        showContactNumber = true;
        showDesignation = true;
        showRequirements = true;
        requirePerson1 = true;
        requireContactNumber = true;
        requireDesignation = true;
      } else if (selectedVisitType == 'Follow-up') {
        showLead = true;
        showDiscussion = true;
        requireLead = true;
      } else if (selectedVisitType == 'Demo') {
        showLead = true;
        showDemoGivenTo = true;
        showStatus = true;
        showCompletionDate = true;
        showFeedback = true;
        requireLead = true;
        requireDemoGivenTo = true;
        requireCompletionDate = true;
      } else if (selectedVisitType == 'Installation') {
        showLead = true;
        showStatus = true;
        showTrainingGivenTo = true;
        showRemarks = true;
        requireLead = true;
        requireTrainingGivenTo = true;
      } else if (selectedVisitType == 'Training') {
        showLead = true;
        showStatus = true;
        showReason = true;
        showTrainingGivenTo = true;
        showRemarks = true;
        requireLead = true;
        requireTrainingGivenTo = true;
      } else if (selectedVisitType == 'Service') {
        showEquipment = true;
        showIssueReport = true;
        showStatus = true;
        showReason = true;
        showRemarks = true;
        requireEquipment = true;
        requireIssueReport = true;
      } else if (selectedVisitType == 'Payment') {
        showLead = true;
        showAmount = true;
        showPaymentCollected = true;
        showRemarks = true;
        requireLead = true;
        requireAmount = true;
        requirePaymentCollected = true;
      }
    });
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String label,
    bool isRequired = false,
    int maxLines = 1,
    bool readOnly = false,
    IconData? prefixIcon,
    IconData? suffixIcon,
    VoidCallback? onSuffixTap,
    bool isFullWidth = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            readOnly: readOnly,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.black87),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 12),
              prefixIcon: null,
              suffixIcon: suffixIcon != null
                  ? IconButton(
                icon: Icon(suffixIcon, color: Colors.grey, size: 16),
                onPressed: onSuffixTap,
              )
                  : null,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF6C5DD3), width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
            ),
            validator: isRequired
                ? (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ${label.toLowerCase()}';
              }
              return null;
            }
                : null,
          ),
        ],
      ),
    );
  }

  Widget buildDropdownField({
    required String label,
    required String hintText,
    required List<String> items,
    required String? value,
    required void Function(String?) onChanged,
    bool isRequired = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          DropdownButtonFormField<String>(
            value: value,
            hint: Text(
              hintText,
              style: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 12),
            ),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: GoogleFonts.poppins(fontSize: 12)),
              );
            }).toList(),
            onChanged: onChanged,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.black87),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF6C5DD3), width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
            ),
            validator: isRequired
                ? (value) {
              if (value == null) {
                return 'Please select a ${label.toLowerCase()}';
              }
              return null;
            }
                : null,
          ),
        ],
      ),
    );
  }

  Widget buildDatePickerField({
    required String label,
    required String hintText,
    required DateTime? selectedDate,
    required void Function(DateTime?) onDatePicked,
    bool isRequired = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          TextFormField(
            readOnly: true,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.black87),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 12),
              suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey, size: 16),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF6C5DD3), width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
            ),
            controller: TextEditingController(
              text: selectedDate != null
                  ? "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"
                  : '',
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: Color(0xFF6C5DD3),
                        onPrimary: Colors.white,
                        surface: Colors.white,
                        onSurface: Colors.black,
                      ), dialogTheme: DialogThemeData(backgroundColor: Colors.white),
                    ),
                    child: child!,
                  );
                },
              );
              onDatePicked(pickedDate);
            },
            validator: isRequired
                ? (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a ${label.toLowerCase()}';
              }
              return null;
            }
                : null,
          ),
        ],
      ),
    );
  }

  Widget buildRadioField({
    required String label,
    required String? value,
    required void Function(String?) onChanged,
    bool isRequired = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              Radio<String>(
                value: 'Yes',
                groupValue: value,
                onChanged: onChanged,
                activeColor: const Color(0xFF6C5DD3),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Text('Yes', style: GoogleFonts.poppins(fontSize: 12, color: Colors.black87)),
              const SizedBox(width: 8),
              Radio<String>(
                value: 'No',
                groupValue: value,
                onChanged: onChanged,
                activeColor: const Color(0xFF6C5DD3),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Text('No', style: GoogleFonts.poppins(fontSize: 12, color: Colors.black87)),
            ],
          ),
          if (isRequired && value == null)
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                'Please select an option',
                style: GoogleFonts.poppins(color: Colors.red, fontSize: 10),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.white,
        elevation: 8,
        contentPadding: const EdgeInsets.all(12),
        titlePadding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.visit == null ? 'Add Visit' : 'Edit Visit',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.grey, size: 20),
              padding: const EdgeInsets.all(0),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: SizedBox(
              width: 650,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer Name',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 2),
                            RawAutocomplete<String>(
                              textEditingController: customerNameController,
                              focusNode: customerNameFocusNode,
                              optionsBuilder: (TextEditingValue textEditingValue) {
                                return widget.customerNames.where((String option) {
                                  return option.toLowerCase().contains(
                                      textEditingValue.text.toLowerCase());
                                }).toList();
                              },
                              fieldViewBuilder: (BuildContext context,
                                  TextEditingController textEditingController,
                                  FocusNode focusNode,
                                  VoidCallback onFieldSubmitted) {
                                return TextFormField(
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, color: Colors.black87),
                                  decoration: InputDecoration(
                                    hintText: 'Enter or select customer name',
                                    hintStyle: GoogleFonts.poppins(
                                        color: Colors.grey[400], fontSize: 12),
                                    suffixIcon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 10),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.grey[300]!, width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Colors.grey[300]!, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF6C5DD3), width: 1.5),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 1),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 1.5),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter customer name';
                                    }
                                    return null;
                                  },
                                );
                              },
                              optionsViewBuilder: (BuildContext context,
                                  AutocompleteOnSelected<String> onSelected,
                                  Iterable<String> options) {
                                return Align(
                                  alignment: Alignment.topLeft,
                                  child: Material(
                                    elevation: 4.0,
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      constraints: const BoxConstraints(maxHeight: 200),
                                      width: 325, // Matches the width of the field
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey[300]!, width: 1),
                                      ),
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount: options.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          final String option = options.elementAt(index);
                                          return GestureDetector(
                                            onTap: () {
                                              onSelected(option);
                                            },
                                            child: ListTile(
                                              title: Text(
                                                option,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: Colors.black87),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: buildDropdownField(
                          label: 'Visit Type',
                          hintText: 'Select Visit Type',
                          items: visitTypes,
                          value: selectedVisitType,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedVisitType = newValue;
                              selectedStatus = null;
                              selectedPaymentCollected = null;
                              selectedCompletionDate = null;
                              updateFieldVisibility();
                            });
                          },
                          isRequired: true,
                        ),
                      ),
                    ],
                  ),
                  if (showPerson1 || showPerson2)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showPerson1
                              ? buildTextField(
                            controller: person1Controller,
                            hintText: 'Enter name of Person 1',
                            label: 'Person 1',
                            isRequired: requirePerson1,
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: showPerson2
                              ? buildTextField(
                            controller: person2Controller,
                            hintText: 'Enter name of Person 2',
                            label: 'Person 2 (if any)',
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if (showPerson3 || showPerson4)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showPerson3
                              ? buildTextField(
                            controller: person3Controller,
                            hintText: 'Enter name of Person 3',
                            label: 'Person 3 (if any)',
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: showPerson4
                              ? buildTextField(
                            controller: person4Controller,
                            hintText: 'Enter name of Person 4',
                            label: 'Person 4 (if any)',
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if (showContactNumber || showDesignation)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showContactNumber
                              ? buildTextField(
                            controller: contactNumberController,
                            hintText: 'Enter contact number',
                            label: 'Contact Number',
                            isRequired: requireContactNumber,
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: showDesignation
                              ? buildTextField(
                            controller: designationController,
                            hintText: 'Enter designation',
                            label: 'Designation',
                            isRequired: requireDesignation,
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if (showRequirements)
                    buildTextField(
                      controller: requirementsController,
                      hintText: 'Enter requirements if any...',
                      label: 'Requirements (if any)',
                      maxLines: 3,
                      isFullWidth: true,
                    ),
                  if (showLead)
                    (selectedVisitType == 'Follow-up')
                        ? buildTextField(
                      controller: leadController,
                      hintText: 'Enter name of Lead',
                      label: 'Lead',
                      isRequired: requireLead,
                      isFullWidth: true,
                    )
                        : const SizedBox.shrink(),
                  if (showDiscussion)
                    buildTextField(
                      controller: discussionController,
                      hintText: 'Enter discussion summary',
                      label: 'Discussion',
                      maxLines: 3,
                      isFullWidth: true,
                    ),
                  if (selectedVisitType == 'Demo' && (showLead || showDemoGivenTo))
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showLead
                              ? buildTextField(
                            controller: leadController,
                            hintText: 'Enter name of Lead',
                            label: 'Lead',
                            isRequired: requireLead,
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: showDemoGivenTo
                              ? buildTextField(
                            controller: demoGivenToController,
                            hintText: 'Enter name of Person/Team',
                            label: 'Demo Given To',
                            isRequired: requireDemoGivenTo,
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if (selectedVisitType == 'Demo' && (showStatus || showCompletionDate))
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showStatus
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              buildDropdownField(
                                label: 'Status',
                                hintText: 'Select Status',
                                items: statusOptions,
                                value: selectedStatus,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedStatus = newValue;
                                    updateFieldVisibility();
                                  });
                                },
                                isRequired: false,
                              ),
                            ],
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: showCompletionDate
                              ? buildDatePickerField(
                            label: 'Completion Date',
                            hintText: 'Select Date',
                            selectedDate: selectedCompletionDate,
                            onDatePicked: (DateTime? date) {
                              setState(() {
                                selectedCompletionDate = date;
                              });
                            },
                            isRequired: requireCompletionDate,
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if (selectedVisitType == 'Demo' && showFeedback)
                    buildTextField(
                      controller: feedbackController,
                      hintText: 'Enter feedback',
                      label: 'Feedback',
                      maxLines: 3,
                      isFullWidth: true,
                    ),
                  if ((selectedVisitType == 'Installation') && (showLead || showStatus))
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showLead
                              ? buildTextField(
                            controller: leadController,
                            hintText: 'Enter name of Lead',
                            label: 'Lead',
                            isRequired: requireLead,
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: showStatus
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              buildDropdownField(
                                label: 'Status',
                                hintText: 'Select Status',
                                items: statusOptions,
                                value: selectedStatus,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedStatus = newValue;
                                    updateFieldVisibility();
                                  });
                                },
                                isRequired: false,
                              ),
                            ],
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if ((selectedVisitType == 'Installation') && showTrainingGivenTo)
                    buildTextField(
                      controller: trainingGivenToController,
                      hintText: 'Enter name of Person/Team',
                      label: 'Training Given To',
                      isRequired: requireTrainingGivenTo,
                      isFullWidth: true,
                    ),
                  if ((selectedVisitType == 'Installation') && showRemarks)
                    buildTextField(
                      controller: remarksController,
                      hintText: 'Enter remarks if any...',
                      label: 'Remarks (if any)',
                      maxLines: 3,
                      isFullWidth: true,
                    ),
                  if (selectedVisitType == 'Training' && (showLead || showStatus))
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showLead
                              ? buildTextField(
                            controller: leadController,
                            hintText: 'Enter name of Lead',
                            label: 'Lead',
                            isRequired: requireLead,
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: showStatus
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              buildDropdownField(
                                label: 'Status',
                                hintText: 'Select Status',
                                items: statusOptions,
                                value: selectedStatus,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedStatus = newValue;
                                    updateFieldVisibility();
                                  });
                                },
                                isRequired: false,
                              ),
                            ],
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if (selectedVisitType == 'Training' && showTrainingGivenTo)
                    buildTextField(
                      controller: trainingGivenToController,
                      hintText: 'Enter name of Person/Team',
                      label: 'Training Given To',
                      isRequired: requireTrainingGivenTo,
                      isFullWidth: true,
                    ),
                  if (selectedVisitType == 'Training' && (showReason && (selectedStatus == 'In Progress' || selectedStatus == 'Cancelled')))
                    buildTextField(
                      controller: reasonController,
                      hintText: 'Enter reason for ${selectedStatus!.toLowerCase()}',
                      label: 'Reason',
                      maxLines: 3,
                      isFullWidth: true,
                    ),
                  if (selectedVisitType == 'Training' && showRemarks)
                    buildTextField(
                      controller: remarksController,
                      hintText: 'Enter remarks if any...',
                      label: 'Remarks (if any)',
                      maxLines: 3,
                      isFullWidth: true,
                    ),
                  if (selectedVisitType == 'Service' && (showEquipment || showIssueReport))
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showEquipment
                              ? buildTextField(
                            controller: equipmentController,
                            hintText: 'Enter name of equipment',
                            label: 'Equipment',
                            isRequired: requireEquipment,
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: showIssueReport
                              ? buildTextField(
                            controller: issueReportController,
                            hintText: 'Enter issue details',
                            label: 'Issue Report',
                            isRequired: requireIssueReport,
                            maxLines: 3,
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if (selectedVisitType == 'Service' && (showStatus || (showReason && (selectedStatus == 'In Progress' || selectedStatus == 'Cancelled'))))
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showStatus
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              buildDropdownField(
                                label: 'Status',
                                hintText: 'Select Status',
                                items: statusOptions,
                                value: selectedStatus,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedStatus = newValue;
                                    updateFieldVisibility();
                                  });
                                },
                                isRequired: false,
                              ),
                            ],
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: (showReason && (selectedStatus == "In Progress" || selectedStatus == "Cancelled"))
                              ? buildTextField(
                            controller: reasonController,
                            hintText: 'Enter reason for ${selectedStatus!.toLowerCase()}',
                            label: 'Reason',
                            maxLines: 3,
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if (selectedVisitType == 'Service' && showRemarks)
                    buildTextField(
                      controller: remarksController,
                      hintText: 'Enter remarks if any...',
                      label: 'Remarks (if any)',
                      maxLines: 3,
                      isFullWidth: true,
                    ),
                  if (selectedVisitType == 'Payment' && (showLead || showAmount))
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showLead
                              ? buildTextField(
                            controller: leadController,
                            hintText: 'Enter name of Lead',
                            label: 'Lead',
                            isRequired: requireLead,
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: showAmount
                              ? buildTextField(
                            controller: amountController,
                            hintText: 'Enter amount',
                            label: 'Amount',
                            isRequired: requireAmount,
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if (selectedVisitType == 'Payment' && showPaymentCollected)
                    buildRadioField(
                      label: 'Payment Collected',
                      value: selectedPaymentCollected,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedPaymentCollected = newValue;
                        });
                      },
                      isRequired: requirePaymentCollected,
                    ),
                  if (selectedVisitType == 'Payment' && showRemarks)
                    buildTextField(
                      controller: remarksController,
                      hintText: 'Enter remarks if any...',
                      label: 'Remarks (if any)',
                      maxLines: 3,
                      isFullWidth: true,
                    ),
                  if (selectedVisitType != 'Demo' && selectedVisitType != 'Installation' && selectedVisitType != 'Training' && selectedVisitType != 'Service' && selectedVisitType != 'Payment' && (showStatus || showCompletionDate))
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showStatus
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              buildDropdownField(
                                label: 'Status',
                                hintText: 'Select Status',
                                items: statusOptions,
                                value: selectedStatus,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedStatus = newValue;
                                    updateFieldVisibility();
                                  });
                                },
                                isRequired: false,
                              ),
                            ],
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: showCompletionDate
                              ? buildDatePickerField(
                            label: 'Completion Date',
                            hintText: 'Select Date',
                            selectedDate: selectedCompletionDate,
                            onDatePicked: (DateTime? date) {
                              setState(() {
                                selectedCompletionDate = date;
                              });
                            },
                            isRequired: requireCompletionDate,
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if (selectedVisitType != 'Demo' && selectedVisitType != 'Installation' && selectedVisitType != 'Training' && selectedVisitType != 'Service' && selectedVisitType != 'Payment' && showFeedback)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showFeedback
                              ? buildTextField(
                            controller: feedbackController,
                            hintText: 'Enter feedback',
                            label: 'Feedback',
                            maxLines: 3,
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if (selectedVisitType != 'Installation' && selectedVisitType != 'Payment' && selectedVisitType != 'Training' && selectedVisitType != 'Service' && (showTrainingGivenTo || showRemarks))
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showTrainingGivenTo
                              ? buildTextField(
                            controller: trainingGivenToController,
                            hintText: 'Enter name of Person/Team',
                            label: 'Training Given To',
                            isRequired: requireTrainingGivenTo,
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: showRemarks
                              ? buildTextField(
                            controller: remarksController,
                            hintText: 'Enter remarks if any...',
                            label: 'Remarks (if any)',
                            maxLines: 3,
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if (selectedVisitType != 'Training' && selectedVisitType != 'Service' && (showEquipment || showIssueReport))
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: showEquipment
                              ? buildTextField(
                            controller: equipmentController,
                            hintText: 'Enter name of equipment',
                            label: 'Equipment',
                            isRequired: requireEquipment,
                          )
                              : const SizedBox.shrink(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: showIssueReport
                              ? buildTextField(
                            controller: issueReportController,
                            hintText: 'Enter issue details',
                            label: 'Issue Report',
                            isRequired: requireIssueReport,
                            maxLines: 3,
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  if (selectedVisitType != 'Training' && selectedVisitType != 'Service' && showReason && (selectedStatus == 'In Progress' || selectedStatus == 'Cancelled'))
                    buildTextField(
                      controller: reasonController,
                      hintText: 'Enter reason for ${selectedStatus!.toLowerCase()}',
                      label: 'Reason (if Status is In Progress or Cancelled)',
                      maxLines: 3,
                      isFullWidth: true,
                    ),
                  if (selectedVisitType != 'Payment' && showPaymentCollected)
                    buildRadioField(
                      label: 'Payment Collected',
                      value: selectedPaymentCollected,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedPaymentCollected = newValue;
                        });
                      },
                      isRequired: requirePaymentCollected,
                    ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (requirePaymentCollected && selectedPaymentCollected == null) {
                      setState(() {});
                      return;
                    }
                    Map<String, String> newVisit = {
                      'index': widget.visit == null
                          ? (widget.visits.length + 1).toString().padLeft(2, '0')
                          : widget.visit!['index']!,
                      'name': customerNameController.text.trim(),
                      'visitId': widget.visit == null
                          ? 'VIS-${2051 + widget.visits.length}'
                          : widget.visit!['visitId']!,
                      'type': selectedVisitType!,
                      if (person1Controller.text.isNotEmpty) 'person1': person1Controller.text,
                      if (person2Controller.text.isNotEmpty) 'person2': person2Controller.text,
                      if (person3Controller.text.isNotEmpty) 'person3': person3Controller.text,
                      if (person4Controller.text.isNotEmpty) 'person4': person4Controller.text,
                      if (contactNumberController.text.isNotEmpty)
                        'contactNumber': contactNumberController.text,
                      if (designationController.text.isNotEmpty)
                        'designation': designationController.text,
                      if (requirementsController.text.isNotEmpty)
                        'requirements': requirementsController.text,
                      if (leadController.text.isNotEmpty) 'lead': leadController.text,
                      if (discussionController.text.isNotEmpty)
                        'discussion': discussionController.text,
                      if (demoGivenToController.text.isNotEmpty)
                        'demoGivenTo': demoGivenToController.text,
                      if (feedbackController.text.isNotEmpty) 'feedback': feedbackController.text,
                      if (trainingGivenToController.text.isNotEmpty)
                        'trainingGivenTo': trainingGivenToController.text,
                      if (remarksController.text.isNotEmpty) 'remarks': remarksController.text,
                      if (equipmentController.text.isNotEmpty) 'equipment': equipmentController.text,
                      if (issueReportController.text.isNotEmpty)
                        'issueReport': issueReportController.text,
                      if (reasonController.text.isNotEmpty) 'reason': reasonController.text,
                      if (amountController.text.isNotEmpty) 'amount': amountController.text,
                      if (selectedStatus != null) 'status': selectedStatus!,
                      if (selectedPaymentCollected != null)
                        'paymentCollected': selectedPaymentCollected!,
                      if (selectedCompletionDate != null)
                        'completionDate': selectedCompletionDate.toString(),
                    };
                    widget.onSave(newVisit, widget.index);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C5DD3),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  widget.visit == null ? 'Add Visit' : 'Save',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ],
        actionsPadding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
      ),
    );
  }
}
