import 'package:facebookui/models/post_model.dart';
import 'package:facebookui/models/story_model.dart';
import 'package:facebookui/models/usermodel.dart';

List<UserModel> users = [
  UserModel(
      id: 1,
      email: "",
      name: "Mohamed Farouk",
      profilePic:
          "https://scontent.fcai3-1.fna.fbcdn.net/v/t1.18169-9/18198545_669250533275288_6734984052345685014_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=eH0Z_XDwIuUAX-2A1S2&_nc_ht=scontent.fcai3-1.fna&oh=410a6e91ca9bf5b4b4c7b47f61ea9da8&oe=616279F5"),
  UserModel(
      id: 2,
      email: "",
      name: "Mohamed Elsayed",
      profilePic:
          "https://scontent.fcai3-1.fna.fbcdn.net/v/t31.18172-8/25188635_770023729864634_4427583475910391826_o.jpg?_nc_cat=104&ccb=1-5&_nc_sid=e3f864&_nc_ohc=e597EyWqNRgAX_w2O2J&_nc_ht=scontent.fcai3-1.fna&oh=55bdc108ec285c5dbc6a11d75ff2450e&oe=6164C9BC"),
  UserModel(
      id: 3,
      email: "",
      name: "Ahmed Mahmoud",
      profilePic:
          "https://scontent.fcai3-1.fna.fbcdn.net/v/t1.18169-9/22815264_749236328610041_6968351522288976120_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=174925&_nc_ohc=XVXbfeCAhEUAX9occb2&_nc_ht=scontent.fcai3-1.fna&oh=39cb4b764326d5f141d542376b47dfb2&oe=61643151"),
  UserModel(
      id: 4,
      email: "",
      name: "Yasser Hisham",
      profilePic:
          "https://scontent.fcai3-1.fna.fbcdn.net/v/t1.18169-9/22789001_749212875279053_6572789181529949578_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=174925&_nc_ohc=swojNuuppw8AX_AjJcT&_nc_ht=scontent.fcai3-1.fna&oh=6d3dcd70fa3dc64df250f9b1a53ea357&oe=61648855"),
  UserModel(
      id: 5,
      email: "",
      name: "Sara Ahmed",
      profilePic:
          "https://scontent.faly3-1.fna.fbcdn.net/v/t39.30808-6/229637003_3001292466826881_7661251707794675297_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=174925&_nc_ohc=tGDoCObVJwQAX87RCn4&_nc_ht=scontent.faly3-1.fna&oh=979e962f6bc4d3363e7b73d1fe27b411&oe=6143F1B6"),
  UserModel(
      id: 6,
      email: "",
      name: "Dina ali",
      profilePic:
          "https://scontent-mrs2-1.xx.fbcdn.net/v/t39.30808-6/226317520_2999410627015065_3857487380453952921_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=174925&_nc_ohc=1ErtIy9RUpUAX8uDVtK&tn=fG8LDpzldNpvnQc_&_nc_ht=scontent-mrs2-1.xx&oh=698429a9f1dd6c0752400f4a1827cca9&oe=61446A8E"),
];

UserModel currentUser = users[0];
List<StoryModel> stories = [
  StoryModel(
      image:
          "https://scontent.fcai3-1.fna.fbcdn.net/v/t39.30808-6/s640x640/241755509_10160776144902573_7246459723601940731_n.jpg?_nc_cat=1&ccb=1-5&_nc_sid=730e14&_nc_ohc=mGbxKt0b9G8AX_iQYMq&_nc_ht=scontent.fcai3-1.fna&oh=e80129faca829725507782f88554f874&oe=6141E209",
      user: users[1]),
  StoryModel(
      image:
          "https://scontent.fcai3-1.fna.fbcdn.net/v/t39.30808-6/241761628_4134872383279221_6023337388867507734_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=Z_z1deBgeE8AX98TdmD&_nc_oc=AQlimnsR6RzqjFkiZpThUaRmWv9MKxoSEQKW6450Ns6a0y3S62IltWqpYJwp4ybD9X4&tn=fG8LDpzldNpvnQc_&_nc_ht=scontent.fcai3-1.fna&oh=63fa1d736bd71e11f87fffd0a1e08a00&oe=61427766",
      user: users[2]),
  StoryModel(
      image:
          "https://scontent.fcai3-1.fna.fbcdn.net/v/t1.6435-9/241795462_5396050773743630_8879804369358113143_n.png?_nc_cat=1&ccb=1-5&_nc_sid=730e14&_nc_ohc=SbY5QJgWhVIAX9Li69f&_nc_ht=scontent.fcai3-1.fna&oh=a8b2dd6546e4e31d1a56df20546d887e&oe=61610D11",
      user: users[4]),
  StoryModel(
      image:
          "https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/241728083_4572781952784420_7507683756955907760_n.jpg?_nc_cat=1&ccb=1-5&_nc_sid=730e14&_nc_ohc=L9fUzOg0eicAX-uSJeu&_nc_ht=scontent.faly3-1.fna&oh=8edd5b6fef850394d90ecd33264aedb1&oe=61647BDB",
      user: users[5]),
  StoryModel(
      image:
          "https://scontent.faly3-1.fna.fbcdn.net/v/t39.30808-6/241654044_4366835820074848_1755294634852917233_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=zZX1QyU7vXEAX-_PO5j&_nc_ht=scontent.faly3-1.fna&oh=fd0508d1230ea7ccda5a9d7a13c7917f&oe=6143EF68",
      user: users[3]),
];

List<PostModel> Posts = [
  PostModel(
      user: users[1],
      text: """محمد عبد المنصف حارس ومدير الكرة لوادي دجلة :
 الشهر اللي فات كنت بخلص ورق و وصلت التمرين متأخر، روحت خصمت لنفسي 3000 تاني يوم روحت بدري شوية كافئت نفسي ب 5000 جنيه""",
      date: "16/8/2021",
      hasimage: true,
      liked: true,
      images: [
        "https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/240535804_131321442559451_7037280947641653283_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=7vi8WyYtgcIAX-cIMhP&_nc_ht=scontent.faly3-1.fna&oh=34c4b2bcb9f6e861133c722490320fdd&oe=616507F7",
      ],
      reactNo: 2,
      likes: 100,
      coments: 50,
      shares: 30),
  PostModel(
      user: UserModel(
          id: 7,
          email: "",
          name: "FilGoal",
          profilePic:
              "https://scontent.faly3-1.fna.fbcdn.net/v/t1.18169-9/14469647_10154013126465642_1080934688154194408_n.png?_nc_cat=1&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=XvrIiHl-cMsAX9PpZPt&_nc_ht=scontent.faly3-1.fna&oh=f8ae05d3fbbe81e7bf88950c385a1669&oe=6164811C"),
      text: """في عودة ملعب سانتياجو برنابيو بعد غياب 560 يومًا
ريال مدريد يحول تأخره إلى فوز بخماسية أمام سيلتا فيجو✅
المرينجي يتصدر جدول الترتيب بـ10 نقاط بفارق الأهداف عن الجار.
وبنزيمة يسجل ثلاثيته السادسة في تاريخه مع ريال مدريد.🔥""",
      date: "2h",
      hasimage: true,
      liked: false,
      images: [
        "https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/s600x600/241775962_10159331362790642_5228681076164875943_n.png?_nc_cat=1&ccb=1-5&_nc_sid=730e14&_nc_ohc=Kfun8TyukHwAX-j7ZUu&_nc_ht=scontent.faly3-1.fna&oh=e5bf5a9d7c4bdf9efc0e457b5bc6793d&oe=6166068D",
        "https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/241824995_10159331362950642_8712619488317367812_n.jpg?_nc_cat=1&ccb=1-5&_nc_sid=730e14&_nc_ohc=qFkVLp9hSD8AX-gC0v_&_nc_ht=scontent.faly3-1.fna&oh=9570f4e22dcbe70f2fae83e2de3024d1&oe=6165978D",
        "https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/241816799_10159331362835642_4155746888727367423_n.jpg?_nc_cat=1&ccb=1-5&_nc_sid=730e14&_nc_ohc=hAoO6Z8NMr0AX_pRajz&_nc_ht=scontent.faly3-1.fna&oh=e4426df1be23adc88457bc4251324344&oe=61631EB5",
        "https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/241801088_10159331363040642_5251198997737654932_n.jpg?_nc_cat=1&ccb=1-5&_nc_sid=730e14&_nc_ohc=HiYXfzWGO_gAX8UZy7B&_nc_ht=scontent.faly3-1.fna&oh=b432406015e34014f2e1ca68bee3571d&oe=61631275",
      ],
      reactNo: 2,
      likes: 700,
      coments: 20,
      shares: 3),
  PostModel(
      user: users[3],
      text: "back to school 💔",
      date: "15/6/2021",
      hasimage: true,
      liked: false,
      images: [
        "https://scontent.faly3-1.fna.fbcdn.net/v/t1.6435-9/241780163_7446931748710756_2057997482491595962_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=730e14&_nc_ohc=JeDQ23jwvHYAX9MyOrL&_nc_ht=scontent.faly3-1.fna&oh=582c754b52fd880060b5199ef4b9874c&oe=6162EAF3"
      ],
      reactNo: 2,
      likes: 10,
      coments: 10,
      shares: 200),
  PostModel(
      user: users[4],
      text:
          "I want someone who will look at me the same way I look at chocolate cake",
      date: "7/7/2021",
      hasimage: false,
      liked: true,
      images: null,
      reactNo: 2,
      likes: 12,
      coments: 3,
      shares: 4),
  PostModel(
      user: users[0],
      text: "This is a test post for my flutter facebook ui",
      date: "13/9/2021",
      hasimage: false,
      liked: false,
      images: null,
      reactNo: 2,
      likes: 17,
      coments: 3,
      shares: 3),
];
