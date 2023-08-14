import 'dart:developer';

import 'dart:io';
import 'package:abonaatomas/church%20Cubit/female%20model.dart';
import 'package:abonaatomas/church%20Cubit/male model.dart';
import 'package:abonaatomas/church%20Cubit/children%20Model.dart';
import 'package:abonaatomas/church%20Cubit/social%20user.dart';
import 'package:abonaatomas/church%20Cubit/states.dart';
import 'package:abonaatomas/dark%20mode/cashe%20helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());
  static SocialCubit get(context) => BlocProvider.of(context);
  SocialUserModel? userModel;
  Childrenmodel? childmodel;

  void getUserData({String? docSearched}) async {
    //! New Code
    //? it is the same but i prefer this way
    try {
      emit(SocialGetUserLoadingState());
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc('1').collection('male').doc('VBlnwGrsbLozY5nj7Ln6')
          .get();

      userModel = SocialUserModel.fromJson(userData.data()!);
      print(userModel.toString());
      log(userModel!.toMap().toString());
      emit(SocialGetUserSuccessState());
    } catch (e) {
      emit(SocialGetUserErrorState(e.toString()));
    }
  }

  void getChildrenData() async {
    try {
      emit(SocialGetUserchildLoadingState());
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc('123456789')
          .get();
      childmodel = Childrenmodel.fromJson(userData.data()!);
      log(childmodel!.toMap().toString());
      emit(SocialGetUserchildSuccessState());
    } catch (e) {
      emit(SocialGetUserchildErrorState(e.toString()));
    }
  }

  bool updateUserDataLoading = false;
  void updateUser({
    required String uid,
    required String phone,
    required String mobile,
    required String govern,
    required String qualify,
    required String job,
    required String age,
    required String healthy,
    required bool male,
    required String birthday,
  }) async {
    SocialUserModel model = SocialUserModel(
      job: job,
      phone: phone,
      mobile: mobile,
      govern: govern,
      qualify: qualify,
      uid: uid,
      age: age,
      healthy: healthy,
      male: male,
      birthday: birthday,
    );

    try {
      emit(SocialUserUpdateLoadingState());
      updateUserDataLoading = true;
      await FirebaseFirestore.instance
          .collection('users')
          .doc('123456789')
          .update(model.toMap());
      emit(SocialUserUpdateSuccessState());
      log('updated Successfully');
      updateUserDataLoading = false;
      getUserData();
    } catch (e) {
      updateUserDataLoading = false;
      log('1 ########################################');
      log(e.toString());
      log('2 ########################################');
      emit(SocialUserUpdateErrorState());
    }
  }

  File? profileImage;
  var picker = ImagePicker();
  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('No Image Selected');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  File? coverimage;
  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverimage = File(pickedFile.path);
      emit(SocialcoverimagePickedSuccessState());
    } else {
      print('No Image Selected');
      emit(SocialcoverimagePickedErrorState());
    }
  }

  void UploadProfileImage() {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
      }).catchError((error) {
        emit(SocialuploadimageErrorState());
      });
    }).catchError((error) {
      emit(SocialuploadimageErrorState());
    });
  }

  void UploadcoverImage() {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverimage!.path).pathSegments.last}')
        .putFile(coverimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
      }).catchError((error) {
        emit(SocialuploadcoverimageErrorState());
      });
    }).catchError((error) {
      emit(SocialuploadcoverimageErrorState());
    });
  }
  bool addUserDataLoading = false;
  Future Adddatamale({
    required mole model,
    int? counter,
    String? gender,
  }) async {
    emit(SocialUseraddLoadingState());
    try {
      addUserDataLoading = true;
      var value = await FirebaseFirestore.instance
          .collection('users')
          .doc('$counter')
          .set(
        {
          "m_data" : model.toMap()
        }

      )
          .then((value) async {
        emit(SocialUseraddSucessState());
          });
    } catch (e) {
      addUserDataLoading = false;
      log('1 ########################################');
      log(e.toString());
      log('2 ########################################');
      emit(SocialUseraddErrorState());
    }
  }
  Future Adddatafemale({
    required femalee model,
    int? counter,
    String? gender,
  }) async {
    emit(SocialUseraddLoadingfemaleState());
    try {
      addUserDataLoading = true;
      var value = await FirebaseFirestore.instance
          .collection('users')
          .doc('$counter')
          .set({

      })
          .then((value) async {
        emit(SocialGetUserfemaleSuccessState());
      });
    } catch (e) {
      addUserDataLoading = false;
      log('1 ########################################');
      log(e.toString());
      log('2 ########################################');
      emit(SocialUseraddfemaleErrorState());
    }
  }
  Future Addchildren({
    required Childrenmodel childe,
    int? counter,
  }) async {
    try {
      emit(SocialUseraddchilderenLoadingState());
      addUserDataLoading = true;
      var value = await FirebaseFirestore.instance
          .collection('users').doc('$counter').collection('children').doc()
          .set(childe.toMap());
      emit(SocialUserChildrenSucessState());
    } catch (e) {
      addUserDataLoading = false;
      log('1 ########################################');
      log(e.toString());
      log('2 ########################################');
      emit(SocialUseraddchilderenErrorState());
    }
  }

  int counter = 1;
  addToCounter(){
    counter++;
    CachHelper.saveData(key: "counter", value: counter);
    emit(ChangeCounterState());
  }



}
