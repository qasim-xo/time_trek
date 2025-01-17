# Time Trek

Time Trek is a Pomodoro app built using Flutter and designed with the MVVM (Model-View-ViewModel) architecture. This app aims to help you maintain focus and boost productivity by implementing the proven Pomodoro technique, which alternates focused work sessions with short breaks.

## Motivation

Distractions are everywhere, and staying focused can be a challenge. I created Time Trek to help overcome this struggle and to bring structure to my work and study sessions. The app is designed to make productivity simple and engaging while ensuring the user stays on track to achieve their goals.

## File Structure
![image](https://github.com/user-attachments/assets/0436e93f-256f-4df8-9b28-684dbadf3255)


## Features

**Pomodoro Timer**: Work in focused time blocks, followed by short breaks.
**Focus Sounds**: Enhance concentration with calming background sounds.
**Customizable Intervals**: Adjust work and break durations to suit your needs.
**Stats**: Track your productivity trends and analyze completed sessions.
**Divided into Projects and Tasks**: Organize your work by projects and break them into manageable tasks.
**Notifications**: Get notified when it's time to take a break or start working again.

## Architecture: MVVM

Time Trek is built using the MVVM architectural pattern to ensure a clean and maintainable codebase. Here’s how the MVVM architecture is implemented in the app:

- **Model**: Handles the business logic, such as timing calculations and data management.
- **View**: Defines the user interface and presents data to the user.
- **ViewModel**: Serves as the bridge between the View and the Model. It processes user input, updates the Model, and notifies the View of any changes.

This separation of concerns ensures the app is scalable, testable, and easy to maintain.

## Technologies and Packages Used

- **Flutter**: For building a cross-platform app with a beautiful and responsive UI.
- **Riverpod**: To manage state efficiently and implement the MVVM architecture.
- **flutter_local_notifications**: For timely reminders.
- **drift**: For local database.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/time-trek.git
   ```
2. Navigate to the project directory:
   ```bash
   cd time-trek
   ```
3. Get the required dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```


## Future Plans

- **Advanced Analytics**: Insights into your productivity trends.
- **Gamification**: Earn rewards and achievements to stay motivated.
- **Block apps**: Block addictive apps to improve focus.


## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve the app.

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Make your changes and commit them:
   ```bash
   git commit -m "Add feature"
   ```
4. Push to the branch:
   ```bash
   git push origin feature-name
   ```
5. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Thank you for checking out Time Trek! I hope this app helps you stay focused and achieve your goals. Let’s embark on a journey toward better productivity together.

