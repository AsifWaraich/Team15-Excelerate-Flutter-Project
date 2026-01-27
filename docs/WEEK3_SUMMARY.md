# Week 3 Summary - LearnHub Flutter App

## Screens fetching data from JSON / API
- **Program Listing Screen (`program_list.dart`)**
  - Uses a `ProgramRepository` to load program data from a local JSON file: `assets/data/programs.json`.
  - Shows a circular loading indicator while data is being fetched.
  - If loading fails, an error message and **Retry** button are displayed.
- **Program Details Screen (`program_details.dart`)**
  - Receives a `Program` object from the listing, which is loaded from JSON.
  - Displays difficulty, duration, and detailed description of the selected program.

## Form added and how it works
- **Login Form (`login_screen.dart`)**
  - Implemented using a `Form` with a `GlobalKey<FormState>`.
  - Fields:
    - **Email** (`TextFormField`): required, must match a simple email pattern.
    - **Password** (`TextFormField`): required, minimum 6 characters, with show/hide password toggle.
  - On submission:
    - Validates fields.
    - Simulates an API call with a short delay.
    - Checks the entered credentials against the locally saved Sign Up account.
    - Navigates to the `HomeScreen`, passing the user’s email.
  - The **Home screen displays the logged-in user's email** at the top.

- **Sign Up Form (`signup_screen.dart`)**
  - Implemented using a `Form` with validation.
  - Fields:
    - Full Name (required)
    - Email (required + valid format)
    - Password (required + minimum 6 characters)
    - Confirm Password (must match Password)
  - On submission:
    - Saves the user info locally using `shared_preferences`.
    - Returns to Login so the user can authenticate with the saved account.

- **Feedback Form (`feedback_screen.dart`)**
  - Accessible from the **Feedback** tile on the Home dashboard (opens a list, then add/edit).
  - Fields:
    - **Full Name**: required.
    - **Email**: required + valid email pattern, pre-filled with the logged-in user’s email but editable.
    - **Feedback message**: required, minimum 10 characters.
  - On submission:
    - Validates the form.
    - Shows a loading indicator while "submitting" (simulated delay).
    - Saves the feedback locally and returns to the list screen.

## Feedback list (view/edit/delete)
- **Feedback List Screen (`feedback_list_screen.dart`)**
  - Displays saved feedback entries.
  - Tap an entry to **edit** it.
  - Delete icon to **delete** an entry (with confirmation).

## Loading and error handling
- **Program Listing**
  - Displays a **CircularProgressIndicator** while loading data from JSON.
  - On error, shows an icon + friendly text + **Retry** button that reloads the data.
- **Forms**
  - **Login form**: submit button shows a small loading spinner and is disabled while the fake login request is in progress.
  - **Feedback form**: submit button shows a loading spinner and is disabled while the fake feedback submission is in progress.

These changes make the app interactive and closer to a real production flow with data fetching, validation, and user feedback.


