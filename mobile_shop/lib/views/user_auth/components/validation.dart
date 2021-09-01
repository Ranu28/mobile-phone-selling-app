int userNameoEmail(String unOrEmail) {
  if (unOrEmail.isEmpty)
    return 1;
  else if (unOrEmail.isNotEmpty) {
    return 2;
  } else
    return 0;
}

String? errorTextUsernameOrEmail(int validateValue) {
  if (validateValue == 1) {
    return "Input Email or username";
  } else if (validateValue == 2) {
    return null;
  }
}

String? errorCountry(int validateValue) {
  if (validateValue == 1) {
    return "Input country";
  } else if (validateValue == 2) {
    return null;
  }
}

String? errorPasswod(int validateValue) {
  if (validateValue == 1) {
    return "Input Password";
  } else if (validateValue == 2) {
    return null;
  }
}
