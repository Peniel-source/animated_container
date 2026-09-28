import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PasswordMeter(),
  ));
}

class PasswordMeter extends StatefulWidget {
  const PasswordMeter({super.key});

  @override
  State<PasswordMeter> createState() => _PasswordMeterState();
}

//This tracks the state for PasswordMeter
class _PasswordMeterState extends State<PasswordMeter> {
  double _barWidth = 0; // this is set to zero initially but will increase as the password earns scores
  Color _barColor = Colors.grey;
  String _label = 'Type your password'; //this is the feedback text under the bar
  Curve _curve = Curves.linear; //the animation is initially set to linear

  static const double _maxBarWidth = 300; // this is the entire width of the full bar

  // The logic happens down here. THe regex patters are used to check if:
  //there is at least a number, an upper case letter and a special character.
  void _checkStrength(String password) {
    int score = 0;
    if (password.length >= 8) score++;
    if (password.contains(RegExp(r'[0-9]'))) score++;
    if (password.contains(RegExp(r'[A-Z]'))) score++;
    if (password.contains(RegExp(r'[!@#$%^&*]'))) score++;

    setState(() {
      //this is how the bar increases. so every new score will add 1/4 of the total width(300)
      _barWidth = _maxBarWidth * score / 4;
      //the if statements below increase the score once their condision is met
      if (password.isEmpty) {
        _barColor = Colors.grey;
        _label = 'Type your password';
      } else if (score <= 1) {
        _barColor = Colors.red;
        _label = 'Weak password';
      } else if (score == 2) {
        _barColor = Colors.orange;
        _label = 'Moderate - not the best btw';
      } else if (score == 3) {
        _barColor = Colors.lightBlue;
        _label = 'Almost there';
      } else {
        _barColor = Colors.green;
        _label = 'Perfect';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: _checkStrength,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            //here we wrap AnimatedContainer in Container to create the grey background
            //the container also tells the bar to fill from left to right
            Container(
              width: _maxBarWidth,
              height: 12,
              color: Colors.grey.shade300,
              alignment: Alignment.centerLeft,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500), //how long the animation takes
                curve: _curve, // the kind of animation
                width: _barWidth, // this is what we get when we keep adding 1/4 at line 37 anytime the score increases
                height: 12,
                color: _barColor, // the different colors you see see when the password is stronger or weaker
              ),
            ),
            const SizedBox(height: 8),
            Text(_label),

            const SizedBox(height: 24),
            Row(
              children: [
                const Text('Curve: '),
                //this lets the user choose what kind of animation curve they want. you acn even add more
                DropdownButton<Curve>(
                  value: _curve,
                  items: const [
                    DropdownMenuItem(value: Curves.linear, child: Text('linear')),
                    DropdownMenuItem(value: Curves.easeInOut, child: Text('easeInOut')),
                    DropdownMenuItem(value: Curves.bounceOut, child: Text('bounceOut')),
                  ],
                  onChanged: (value) => setState(() => _curve = value!),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}