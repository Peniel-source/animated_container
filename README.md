# animated_container
For class activity: Widget Presentation

## My Use Case: 
A password strength meter that uses regex to check the strength level of your password. It expects your password to contain
at least: 8 characters, an upper case letter, a number, and a special character. Animated Container was used for the meter bar.

## What is AnimatedCOntainer?
This is a widget in Flutter that allows you to smoothly transition between UI changes with a certain kind of animation(curve).
So when you provide new values that should change the UI, it doesn't just jump into the new state, it transitions smoothly.

## How to run:
1. Clone the repo : git clone https://github.com/Peniel-source/animated_container.git
2. run: flutter pub - to get dependencies and packages
3. run: flutter run  - (Ensure your emulator is up and running)

## Three Attributes
### 1. duration: 
this is the amount of time the transition takes, so you might want to change the duration to get what transition time suits you.
So you can set it with duration: const Duration(milliseconds: 500) in the AnimatedContainer widget. This is required but has no default.
### 2. curve:
This is what determines how the transition relates to time. So in some documentation, you'll find that they are actual graphs. 
The default is Curves.linear. What they do on your UI is quite amazing: linear gives a constant flow or transition, while bounceOut makes
the transition bouncy.
### 3. width, color, heigh, etc.:
These are the set of attributes you want to use to tell what the changes really are, so it really depends on what you want. In my example,
height was constant, while width(_barWidth) and color(_barColor) kept growing the bar as the strength score increased

## Screenshot
[Final UI](screenshots/final.png)

## Sources
[Flutter docs](https://docs.flutter.dev/cookbook/animation/animated-container)
There's a section in the flutter docs page for AnimatedContainer where you can experiment with the different curves.
