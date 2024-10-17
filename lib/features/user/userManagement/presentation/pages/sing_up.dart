import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/constants/colors.dart';
import '../../../home/presentation/pages/home_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  // Store user input
  String _gender = '';
  String _goal = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  // Date picker for birth date
  DateTime? _selectedDate;

  // Form keys
  final _formKey = GlobalKey<FormState>();
  bool _genderError = false;
  bool _birthdateError = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildFirstPage(),
              _buildSecondPage(),
              _buildThirdPage(),
              _buildFourthPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstPage() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  Image.asset('assets/images/onboardingImage.png'),
                  SizedBox(height: 5),
                  _buildValidatedInputField(
                    controller: _nameController,
                    labelText: 'الاسم',
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال الاسم';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  _buildValidatedInputField(
                    controller: _emailController,
                    labelText: 'البريد الإلكتروني',
                    icon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال البريد الإلكتروني';
                      }
                      if (!RegExp(r'^[\w-]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                        return 'البريد الإلكتروني غير صالح';
                      }
                      return null;
                    },
                  ),
                  // Display existing email below email field
                  SizedBox(height: 5),
                  Text(
                    _emailController.text.isNotEmpty
                        ? 'البريد الإلكتروني: ${_emailController.text}'
                        : '',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  _buildValidatedInputField(
                    controller: _passwordController,
                    labelText: 'كلمة المرور',
                    icon: Icons.lock,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال كلمة المرور';
                      }
                      if (value.length < 6) {
                        return 'يجب أن تكون كلمة المرور على الأقل 6 أحرف';
                      }
                      if (!RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$')
                          .hasMatch(value)) {
                        return 'كلمة المرور يجب أن تحتوي على حرف، ورقم، ورمز خاص';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          _buildBottomButton('استمر', () {
            if (_formKey.currentState!.validate()) {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          }),
        ],
      ),
    );
  }

  Widget _buildValidatedInputField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    required String? Function(String?) validator,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.right,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: validator,
    );
  }

  Widget _buildSecondPage() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50),
                Text('اختر الجنس', style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGenderCard('ذكر', Icons.male),
                    SizedBox(width: 20),
                    _buildGenderCard('أنثى', Icons.female),
                  ],
                ),
                _genderError ? Text('الرجاء اختيار الجنس', style: TextStyle(color: Colors.red)) : Container(),
                SizedBox(height: 30),
                Text(
                  'اختر تاريخ الميلاد',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 10),
                _buildDatePicker(),
                _birthdateError ? Text('الرجاء اختيار تاريخ الميلاد', style: TextStyle(color: Colors.red)) : Container(),
              ],
            ),
          ),
        ),
        _buildBottomButton('استمر', () {
          setState(() {
            _genderError = _gender.isEmpty;
            _birthdateError = _selectedDate == null;
          });
          if (!_genderError && !_birthdateError) {
            _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        }),
      ],
    );
  }

  Widget _buildDatePicker() {
    return ElevatedButton(
      onPressed: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime(1998, 4, 15),
          firstDate: DateTime(1900),
          lastDate: DateTime(2025),
        );
        if (picked != null) {
          setState(() {
            _selectedDate = picked;
          });
        }
      },
      child: Text(
        _selectedDate == null
            ? "اختر تاريخ الميلاد"
            : "${_selectedDate!.toLocal()}".split(' ')[0],
      ),
    );
  }

  Widget _buildThirdPage() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 50),
                  _buildValidatedInputField(
                    controller: _heightController,
                    labelText: 'الطول (سم)',
                    icon: Icons.height,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال الطول';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  _buildValidatedInputField(
                    controller: _weightController,
                    labelText: 'الوزن (كجم)',
                    icon: Icons.fitness_center,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال الوزن';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          _buildBottomButton('استمر', () {
            if (_formKey.currentState!.validate()) {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          }),
        ],
      ),
    );
  }

  Widget _buildFourthPage() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50),
                Text('ما هو هدفك؟', style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                _buildGoalCard('إنقاص الوزن'),
                SizedBox(height: 10),
                _buildGoalCard('زيادة الوزن'),
                SizedBox(height: 10),
                _buildGoalCard('الحفاظ على الوزن'),
              ],
            ),
          ),
        ),
        _buildBottomButton('إنشاء الحساب', () {
          if (_goal.isNotEmpty) {
            _createAccount();
          }
        }),
      ],
    );
  }

  Widget _buildGoalCard(String goal) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _goal = goal;
        });
      },
      child: Card(
        elevation: 5,
        color: _goal == goal ? Colors.green : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              goal,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderCard(String gender, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _gender = gender;
        });
      },
      child: Card(
        elevation: 5,
        color: _gender == gender ? Colors.green : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40),
              SizedBox(height: 10),
              Text(gender, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          backgroundColor: AppColors.primaryColor, // Replace with your primary color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Future<void> _createAccount() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Save additional user data to Firestore
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'name': _nameController.text.trim(),
        'gender': _gender,
        'goal': _goal,
        'birthdate': _selectedDate,
        'height': _heightController.text.trim(),
        'weight': _weightController.text.trim(),
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle registration errors
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('خطأ'),
          content: Text(e.message ?? 'حدث خطأ، الرجاء المحاولة لاحقًا.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('حسناً'),
            ),
          ],
        ),
      );
    }
  }
}
