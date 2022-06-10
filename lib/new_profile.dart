import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../navigationDrawer.dart';

class NewProfile extends StatefulWidget {
  static const String routeName = '/newProfile';
  const NewProfile({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>LocationUpdateState();
}
class LocationUpdateState extends State<NewProfile> {
  final TextEditingController shopNameController=TextEditingController();
  final TextEditingController ownerNameController=TextEditingController();
  final TextEditingController phoneNumberController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController addressController=TextEditingController();
  final TextEditingController locationController=TextEditingController();
  final TextEditingController adhaarController=TextEditingController();
  final TextEditingController fromTimeController=TextEditingController();
  final TextEditingController toTimeController=TextEditingController();
  late String myLocation='Press Get Location';
  bool _isGettingLocation=false;
  late File? imagePath=File('/storage/emulated/0/Download/images (16).jpeg');
  @override
  void initState() {
    locationController.text=myLocation;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const NavigationDrawer(),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children:  <Widget>[
                Flexible(child: TextField(
                    controller: shopNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Shop Name',
                    )
                ), flex: 0,),
                const SizedBox(height: 10),
                Flexible(child: TextField(
                    controller: ownerNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Owner Name',
                    )
                ), flex: 0,),
                const SizedBox(height: 10),
                Flexible(child: TextField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                    )
                ), flex: 0,),
                const SizedBox(height: 10),
                Flexible(child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    )
                ), flex: 0,),
                const SizedBox(height: 10),
                Flexible(child: TextField(
                    controller: addressController,
                    minLines: 6,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Address',
                    )
                ), flex: 0,),
                const SizedBox(height: 10),
                Row(
                    children: [
                      Expanded(child: Center(child:Text(
                        myLocation,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ))), Visibility(visible: _isGettingLocation,child:const CircularProgressIndicator(
                        backgroundColor: Colors.grey,
                        color: Colors.purple,
                      )),
                      const SizedBox(width: 10),ElevatedButton(
                        child: const Text('Get Location'),
                        onPressed: () {
                          setState(() {
                            locationController.text='Fetching Location';
                            _isGettingLocation = true;
                          });
                          getLocation();
                        },
                      ),
                    ]),
                const SizedBox(height: 10),
                Flexible(child: TextField(
                    controller: adhaarController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Adhaar Number',
                    )
                ), flex: 0,),
                const SizedBox(height: 10),
                Row(children:[Image.file(imagePath!,width: 100,height: 100,fit: BoxFit.fill),
                  const SizedBox(width: 10),
                  Flexible(child: ElevatedButton(
                    child: const Text('Photos'),
                    onPressed: () async {
                      List<String> values = ['Camera', 'Gallery', 'Cancel'];
                      await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: const Text("Choose how to pick?"),
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  shrinkWrap: true, //MUST TO ADDED
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (ctx, index) {
                                    return SimpleDialogOption(
                                      onPressed: () async {
                                        switch(index){
                                          case 0:
                                            openCamera();
                                            break;
                                          case 1:
                                            openGallery();
                                            break;
                                          default:break;
                                        }
                                        Navigator.pop(context);
                                      },
                                        child: Text(values[index],
                                        ),
                                    );
                                  },
                                  itemCount: values.length,
                                ),
                              ),
                          ],
                          );
                        },
                      );
                    },
                  ), flex: 0,),]),
              ],
            )
        )
    );
    locationController.text=myLocation;
  }
  Future<void> getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // print('Latitude:'+position.latitude.toString());
    // print('Longitude:'+position.longitude.toString());
    setState(() {
      _isGettingLocation=false;
      myLocation=position.latitude.toString()+","+position.longitude.toString();
    });
  }

  Future<void> openCamera() async {
    final ImagePicker _picker = ImagePicker();
    // Capture a photo
    final File? photo = (await _picker.pickImage(source: ImageSource.camera)) as File?;
    processImageFile(photo);
  }

  Future<void> openGallery() async {
    final ImagePicker _picker = ImagePicker();
    // Capture a photo
    final File? photo = (await _picker.pickImage(source: ImageSource.gallery)) as File?;
    processImageFile(photo);
  }
  void processImageFile(File? photo) {
    setState(() {
      imagePath=photo;
    });
  }
}
