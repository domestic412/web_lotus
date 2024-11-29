import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/info_signin_controller.dart';

void checkInfoUser() {
  switch (box.read(userName_signin)) {
    case null:
      break;
    default:
      {
        switch (inforUserController.userName.value) {
          case '':
            {
              switch (box.read(is_staff_signin)) {
                case 0:
                  {
                    inforUserController.updateInfoShipperController(
                      isStaff: 0,
                      userId: box.read(userId_signin),
                      userName: box.read(userName_signin),
                      managingOfficeId: box.read(managingOfficeId_signin),
                      consigneeList: box.read(consigneeList_signin),
                      termList: box.read(termList_signin),
                    );
                  }
                  break;
                case 1:
                  {
                    inforUserController.updateInfoStaffController(
                      isStaff: 1,
                      userId: box.read(userId_signin),
                      userName: box.read(userName_signin),
                      managingOfficeId: box.read(managingOfficeId_signin),
                    );
                    break;
                  }
              }
              break;
            }
          default:
            break;
        }
      }
  }
}
