import 'package:ecomerce/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User user= User(name: 'Nombre', email: 'nombre@gmail.com', phone: '+34600112233');
  List<User> listUser= [];
  String image= '/Users/laura/Library/Developer/CoreSimulator/Devices/26EECFF7-C692-487C-83ED-F303999AA657/data/Containers/Data/Application/CC420D3A-6EC3-4FBF-AEC2-7B2E95F63E84/tmp/image_picker_610A29EC-4DD8-4633-B15E-29F9E00E9D3A-1966-000000C429F00C10.jpg';
  List<String> listImages= [];


  UserProvider() {
    fetchUser();
  }

  Future fetchUser() async {
    listImages.add(image);
  }
  void changeProfile(User newInformation) async{
    user = newInformation;

    notifyListeners();
  }
  void changeImage(String newImage) async{
        image= newImage;

    notifyListeners();

  }

}
