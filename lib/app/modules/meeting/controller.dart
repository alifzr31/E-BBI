import 'package:elearning/app/data/providers/dashboard_provider.dart';
import 'package:elearning/app/data/providers/materi_provider.dart';
import 'package:elearning/app/modules/dashboard/controller.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MeetingController extends GetxController {
  final roomName = ''.obs;
  final nama_user = ''.obs;
  final email = ''.obs;

  void joinMeeting(BuildContext context) async {
    final userController =
        Get.put(DashboardController(dashboardProvider: DashboardProvider()));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('role') == 'siswa') {
      nama_user.value = userController.profileSiswa.value?.nama ?? '';
      email.value = '${userController.profileSiswa.value?.user?.username}@gmail.com';
    } else {
      nama_user.value = userController.profileGuru.value?.nama ?? '';
      email.value = '${userController.profileGuru.value?.user?.username}@gmail.com';
    }
    Map<String, Object> featureFlags = {};

    // Define meetings options here
    var options = JitsiMeetingOptions(
      roomNameOrUrl: roomName.value,
      // serverUrl: serverUrl,
      // subject: roomName.text,
      // token: tokenText.text,
      isAudioMuted: false,
      isAudioOnly: false,
      isVideoMuted: true,
      userDisplayName: nama_user.value,
      userEmail: email.value,
      featureFlags: featureFlags,
    );

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeetWrapper.joinMeeting(
      options: options,
      listener: JitsiMeetingListener(
        onOpened: () => debugPrint("onOpened"),
        onConferenceWillJoin: (url) {
          showDialog(
            context: context,
            builder: (context) {
              return Container(
                height: 100,
                width: 100,
                color: Colors.white,
                child: Center(
                  child: Text(url),
                ),
              );
            },
          );
          debugPrint("onConferenceWillJoin: url: $url");
        },
        onConferenceJoined: (url) {
          debugPrint("onConferenceJoined: url: $url");
        },
        onConferenceTerminated: (url, error) {
          debugPrint("onConferenceTerminated: url: $url, error: $error");
        },
        onAudioMutedChanged: (isMuted) {
          debugPrint("onAudioMutedChanged: isMuted: $isMuted");
        },
        onVideoMutedChanged: (isMuted) {
          debugPrint("onVideoMutedChanged: isMuted: $isMuted");
        },
        onScreenShareToggled: (participantId, isSharing) {
          debugPrint(
            "onScreenShareToggled: participantId: $participantId, "
            "isSharing: $isSharing",
          );
        },
        onParticipantJoined: (email, name, role, participantId) {
          debugPrint(
            "onParticipantJoined: email: $email, name: $name, role: $role, "
            "participantId: $participantId",
          );
        },
        onParticipantLeft: (participantId) {
          debugPrint("onParticipantLeft: participantId: $participantId");
        },
        onParticipantsInfoRetrieved: (participantsInfo, requestId) {
          debugPrint(
            "onParticipantsInfoRetrieved: participantsInfo: $participantsInfo, "
            "requestId: $requestId",
          );
        },
        onChatMessageReceived: (senderId, message, isPrivate) {
          debugPrint(
            "onChatMessageReceived: senderId: $senderId, message: $message, "
            "isPrivate: $isPrivate",
          );
        },
        onChatToggled: (isOpen) => debugPrint("onChatToggled: isOpen: $isOpen"),
        onClosed: () {
          Get.back();
          final materiController = Get.put(MateriController(materiProvider: MateriProvider()));
          materiController.selesaiLicon();
          materiController.fetchOneLicon();
        },
      ),
    );
  }
}
