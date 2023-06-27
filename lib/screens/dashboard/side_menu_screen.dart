import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:assignment/constants/colors.dart';
import 'package:sizer/sizer.dart';

class AdminDrawerMenuScreen extends StatefulWidget {
  final String? userRollType;
  final String? userName;
  final String? userEmail;
  final String? profileImage;

  const AdminDrawerMenuScreen(
      {Key? key,
      this.userRollType,
      this.userName,
      this.userEmail,
      this.profileImage})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AdminDrawerMenuScreenState createState() => _AdminDrawerMenuScreenState();
}

class _AdminDrawerMenuScreenState extends State<AdminDrawerMenuScreen> {
  List<String> screens = [
    "Dashboard",
    "manage Orders",
    "Manage Jobs",
    "General Inventory",
    "Masters",
    "Manage Users",
    "Manage Inventory"
  ];
  List<String> masterSubMenu = [
    "Manage Warehouses",
    "Manage Aisles",
    "Manage Levels",
    "Manage Bays",
    "Manage Phases and Codes"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: drawerForSuperAdminWidget(),
    );
  }

  Widget drawerForSuperAdminWidget() {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: darkBlue,
          ), //BoxDecoration
          child: profile(), //UserAccountDrawerHeader
        ), //DrawerHeader
        ListTile(
          title: Text(screens[0].toUpperCase()),
          onTap: () {
            selectedItemForDrawer(context, 0, screens[0].toUpperCase());
          },
        ),
        ListTile(
          title: Text(screens[1].toUpperCase()),
          onTap: () {
            selectedItemForDrawer(context, 1, screens[1].toUpperCase());
          },
        ),
        ListTile(
          title: Text(screens[2].toUpperCase()),
          onTap: () {
            selectedItemForDrawer(context, 2, screens[2].toUpperCase());
          },
        ),
        ListTile(
          title: Text(screens[3].toUpperCase()),
          onTap: () {
            selectedItemForDrawer(context, 3, screens[3].toUpperCase());
          },
        ),
        ExpansionTile(
          title: Text(
            screens[4].toUpperCase(),
            style: const TextStyle(
              color: Colors.black, // Set the default color of the text
            ),
          ),
          iconColor: Colors.black,
          children: <Widget>[
            ListTile(
              title: Text(masterSubMenu[0].toUpperCase()),
              onTap: () {
                selectedItemForMaster(context, 0, masterSubMenu[0]);
              },
            ),
            ListTile(
              title: Text(masterSubMenu[1].toUpperCase()),
              onTap: () {
                selectedItemForMaster(context, 1, masterSubMenu[1]);
              },
            ),
            ListTile(
              title: Text(masterSubMenu[2].toUpperCase()),
              onTap: () {
                selectedItemForMaster(context, 2, masterSubMenu[2]);
              },
            ),
            ListTile(
              title: Text(masterSubMenu[3].toUpperCase()),
              onTap: () {
                selectedItemForMaster(context, 3, masterSubMenu[3]);
              },
            ),
            ListTile(
              title: Text(masterSubMenu[4].toUpperCase()),
              onTap: () {
                selectedItemForMaster(context, 4, masterSubMenu[4]);
              },
            ),
          ],
        ),
        ListTile(
          title: Text(screens[5].toUpperCase()),
          onTap: () {
            selectedItemForDrawer(context, 4, screens[5].toUpperCase());
          },
        ),
        ListTile(
          title: Text(screens[6].toUpperCase()),
          onTap: () {
            selectedItemForDrawer(context, 5, screens[6].toUpperCase());
          },
        ),
      ],
    );
  }

  Widget profile() {
    return Container(
      color: darkBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                  child: SizedBox.fromSize(
                      size: const Size.fromRadius(48), // Image radius
                      child: ClipOval(
                          child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        // child: widget.profileImage == "string " ||
                        //         widget.profileImage == null
                        //     ?
                              child: const CircleAvatar(
                                backgroundColor: white,
                                child: Icon(
                                  size: 78,
                                  Icons.person,
                                ))
                            // : Image.network(
                            //     "$"imageBaseURL"/${widget.profileImage}",
                            //     fit: BoxFit.fill)
                        ,
                      )))),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 2.w),
                        child: Text(
                          widget.userName ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          // style: t18bW,
                        )),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.only(
                                  left: 2.w,
                                ),
                                child: Text(
                                  widget.userEmail ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  // style: ,
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    InkWell(
                      onTap: () {
                        selectedItemForDrawer(context, 6, "");
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              "manageProfile",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color:white ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void selectedItemForMaster(BuildContext context, int index, String? title) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => ManageWareHousesScreen(
        //           title: title,
        //         )));
        break;
      case 1:
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => ManageAislesScreen(
        //           title: title,
        //         )));
        break;
      case 2:
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => ManageLevelScreen(
        //           title: title,
        //         )));
        break;
      case 3:
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => ManageBaysScreen(
        //           title: title,
        //         )));
        break;
      case 4:
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => ManagePhasesCodes(
        //           title: title,
        //         )));
        break;
      default:
        if (kDebugMode) {
          print('invalid entry');
        }
    }
  }

  void selectedItemForDrawer(BuildContext context, int index, String? title) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        if (kDebugMode) {
          print(title);
        }
        break;
      case 1:
        if (kDebugMode) {
          print(title);
        }
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => const ManageOrderScreen(
        //           fromLocation: "",
        //         )));
        break;
      case 2:
        if (kDebugMode) {
          print(title);
        }
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => ManageJobScreen(
        //           title: title,
        //         )));
        break;
      case 3:
        if (kDebugMode) {
          print(title);
        }
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => const GeneralInventoryScreen(
        //           fromLocation: "",
        //         )));
        break;
      case 4:
        if (kDebugMode) {
          print(title);
        }
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => const ManageUsersScreen(
        //           title: "Manage Users",
        //         )));
        break;
      case 5:
        if (kDebugMode) {
          print(title);
        }
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => const ManageInventoryScreen()));
        break;
      case 6:
        if (kDebugMode) {
          print(title);
        }
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const ManageProfile(),
        // ));
        break;
      default:
        if (kDebugMode) {
          print('invalid entry');
        }
    }
  }
}
