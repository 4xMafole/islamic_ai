import 'package:flutter/material.dart';
import 'package:islamic_ai/common/widgets/widgets.dart';
import 'package:islamic_ai/features/profile/widgets/widgets.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  String? _selectedGender;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconData: Icons.arrow_back,
        onPressed: () => Navigator.pop(context),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 18,
            color: IAIColor.separator,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ProfileHeader(),
                  const SizedBox(height: 32),
                  ProfileCustomTextField(
                    controller: _firstNameController,
                    hintText: 'What’s your first name?',
                  ),
                  const SizedBox(height: 24),
                  ProfileCustomTextField(
                    controller: _lastNameController,
                    hintText: 'Enter your last name?',
                  ),
                  const SizedBox(height: 24),
                  CustomDropdown(
                    hintText: 'Select your gender',
                    value: _selectedGender,
                    dropDownItems: const <String>['Male', 'Female'],
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value ?? '';
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  CustomDatePicker(
                    hintText: 'What is your date of birth?',
                    selectedDate: _selectedDate,
                    onDateSelected: (DateTime value) {
                      setState(() {
                        _selectedDate = value;
                      });
                    },
                  ),
                  const SizedBox(height: 70),
                  CustomButton(
                    text: 'Update Profile',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
