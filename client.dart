import 'Contact.dart';

class client {
  String? Name;
  Contact? contactinfo;
  client({this.Name, this.contactinfo});
  dispalyinfo() {
    print("Name:$Name");
    print("contact:$contactinfo");
  }
}
