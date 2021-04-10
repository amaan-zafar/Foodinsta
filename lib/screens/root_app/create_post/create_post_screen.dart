import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_insta/components/bottom_img_picker.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_dropdown.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/custom_textfield.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/controllers/location_controller.dart';
import 'package:food_insta/controllers/post_controller.dart';
import 'package:food_insta/models/create_post.dart';
import 'package:food_insta/models/product.dart';
import 'package:food_insta/theme.dart';
import 'package:geocoder/geocoder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  Product product = Product();
  CreatePost post = CreatePost();
  File _foodImg;
  final picker = ImagePicker();
  String _selectedUnit = 'kg';
  List<String> _units = ['kg', 'Meals'];
  final _formKey = GlobalKey<FormState>();

  String _validate(String value, bool isRequired) {
    if (value.isEmpty && isRequired) return Constants.ERR_EMPTY_FIELD;
    return null;
  }

  String _validatePhone(String value) {
    int _phone = int.tryParse(value);
    if (value.length != 10 || _phone == null)
      return 'Invalid Phone Number';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomBackground(),
        SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                centerTitle: true,
              ),
              Consumer<PostController>(builder: (context, controller, child) {
                if (controller.newPostState == NewPostState.Loading) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        child: _buildForm(context, controller),
                      ),
                    ),
                  );
              }),
            ],
          ),
        ),
      ],
    ));
  }

  _buildForm(BuildContext context, PostController controller) {
    return CustomAppCard(
      children: [
        SizedBox(height: 16),
        Text(
          'Tell us about the food',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Container(
            height: MediaQuery.of(context).size.height / 1.7,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    _buildUploadPhoto(context),
                    _buildPickupLocation(),
                    _buildQuantity(context),
                    CustomTextField(
                      onSaved: (value) {
                        post.phone = int.parse(value);
                      },
                      keyboardType: TextInputType.phone,
                      hintText: 'Contact Details',
                      validator: (value) {
                        return _validatePhone(value);
                      },
                    ),
                    CustomTextField(
                      onSaved: (value) {
                        product.description = value;
                      },
                      minLines: 4,
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      hintText: 'Description',
                      validator: (value) {
                        return _validate(value, false);
                      },
                    ),
                  ],
                ),
              ),
            )),
        SizedBox(
          width: double.infinity,
          child: CustomTextButton(
            highlightColor: Colors.lightBlue,
            onPressed: () async {
              // TODO: change newPostState to loading while creating new post
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                post.product = product;
                controller
                    .createNewPost(post)
                    .whenComplete(() => Navigator.of(context).pop());
              }
            },
            textOnButton: 'CreatePost',
            color: Styles.buttonColor2,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildPickupLocation() {
    return Consumer<LocationController>(builder: (context, controller, child) {
      Address address = controller.firstAddress;
      return Row(
        children: [
          Expanded(
            flex: 3,
            child: CustomTextField(
              enabled: false,
              onSaved: (value) {
                post.address = address.addressLine;
                post.city = address.locality;
                post.location = address.coordinates.latitude.toString() +
                    ',' +
                    address.coordinates.longitude.toString();
              },
              keyboardType: TextInputType.streetAddress,
              hintText: controller.loadingStatus ==
                          CurrentLocationStatus.Initial ||
                      controller.loadingStatus == CurrentLocationStatus.Loading
                  ? 'Pickup Location'
                  : '${address.subLocality}, ${address.locality}',
              validator: (value) {
                return address == null ? 'Pickup Location is required' : null;
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: controller.loadingStatus == CurrentLocationStatus.Initial
                ? IconButton(
                    icon: Icon(
                      MdiIcons.crosshairsGps,
                      color: Styles.iconColor,
                    ),
                    onPressed: () {
                      controller.setCurrentLocation();
                    })
                : controller.loadingStatus == CurrentLocationStatus.Loading
                    ? Center(child: CircularProgressIndicator())
                    : Icon(
                        MdiIcons.mapMarkerCheck,
                        color: Styles.iconColor,
                      ),
          ),
        ],
      );
    });
  }

  Row _buildQuantity(context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: CustomTextField(
            onSaved: (value) {
              product.weight = '$value $_selectedUnit';
            },
            keyboardType: TextInputType.number,
            hintText: 'Approx. quantity',
            validator: (value) {
              return _validate(value, false);
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: CustomDropDown(
            hint: Center(
              child:
                  Text('Units', style: Theme.of(context).textTheme.bodyText1),
            ),
            value: _selectedUnit,
            list: _units,
            onChanged: (value) {
              setState(() {
                _selectedUnit = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUploadPhoto(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return BottomImgPicker(
                      onTapGallery: () {
                        _getFoodImg(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                      onTapCamera: () {
                        _getFoodImg(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                    );
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Styles.iconColor),
                  borderRadius: BorderRadius.circular(16)),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      MdiIcons.cameraPlus,
                      color: Styles.iconColor,
                    ),
                    Text(
                      'Upload your food image',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Styles.iconColor),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        _foodImg != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        _foodImg,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      child: IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          setState(() {
                            _foodImg = null;
                          });
                        },
                      ),
                      right: 1,
                      top: 1,
                    )
                  ],
                ),
              )
            : Container()
      ],
    );
  }

  Future _getFoodImg(source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _foodImg = File(pickedFile.path);
        post.product.prodImg = _foodImg;
      } else {
        print('No image selected.');
      }
    });
  }
}
