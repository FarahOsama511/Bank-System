class Contact {
  int? phone;
  String? email;
  Contact({this.email, this.phone});
  displayContact() {
    print('Email: $email');
    print('Phone: $phone');
  }
}
