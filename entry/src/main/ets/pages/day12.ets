import { PrintExtensionAbility } from '@kit.BasicServicesKit';
import router from '@ohos.router';
import http from '@ohos.net.http';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  // 新增登录相关状态变量
  @State typeid: string = '';
  @State userUsername: string = '';
  @State userPassword: string = '';

  build() {
    Stack() {
      Row(){
        Stack() {
          Image($r("app.media.login"))// 确保图片放在src/main/resources/base/media目录
            .width('100%')
            .height('30%')
            .objectFit(ImageFit.Cover)
          Row() {
            Text('您好！')
              .fontSize(40)
            Text('欢迎使用！')
              .fontSize(25)
              .padding({top:5})
          }
          .padding({right:60})
        }
      }
      .position({x:0,y:0})

      RelativeContainer() {
        // 新增用户登录区域

        Image("")
          .backgroundColor(Color.White)
          .width('100%')
          .height('100%')
          .position({x:0,y:-50})
          .borderRadius({topLeft: 20,topRight: 20})
        TextInput({ text: this.userUsername, placeholder: '用户账号' })
          .id('userUser')
          .height(40)
          .width('80%')
          .margin({ top: 40 })
          .alignRules({
            top: { anchor: 'adminBtn', align: VerticalAlign.Bottom },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .onChange((value) => {
            this.userUsername = value;
          })

        TextInput({ text: this.userPassword, placeholder: '用户密码' })
          .id('userPwd')
          .type(InputType.Password)
          .height(40)
          .width('80%')
          .margin({ top: 10 })
          .alignRules({
            top: { anchor: 'userUser', align: VerticalAlign.Bottom },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }

          })
          .onChange((value) => {
            this.userPassword = value;
          })

        Button('登录')
          .id('userBtn')
          .width('80%')
          .margin({ top: 20 })
          .backgroundColor(Color.Green)
          .onClick(async () => {
            // 接收 LoginCheck 返回值
            const result = await LoginCheck(this.userUsername, this.userPassword);

            if (result[0]) {
              // 登录成功逻辑，如跳转页面或提示
              promptAction.showToast({
                message: '登录成功',
                duration: 2000,
                bottom:670
              })
              if (result[1]=="2") {
                console.log("登录成功，用户类型为："+result[1]);
                router.pushUrl({ url: 'pages/day13index' }); // 示例：跳转到主页
              }else if(result[1]=="3"){
                console.log("登录成功，用户类型为："+result[1]);
                router.pushUrl({ url: 'pages/day14wode' });
              }


            } else {
              // 登录失败逻辑，提示用户
              promptAction.showToast({
                message: '登录失败，检查账号密码是否正确！',
                duration: 2000,
                bottom:670
              })
            }
          })




          .alignRules({
            top: { anchor: 'userPwd', align: VerticalAlign.Bottom },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
      }
      .height('100%')
      .width('100%')
      .margin({ top: 500})
    }.backgroundColor(Color.Gray)
  }
}
async function LoginCheck(username: string, password: string): Promise<[boolean,string]> {
  let httpRequest = http.createHttp();

  interface UserInfo {
    id: string;
    username: string;
    realname: string;
    avatar: string|null; // 可能为 null 或字符串
    birthday: string|null; // 可能为 null 或日期字符串
    sex: number;
    email: string|null; // 可能为 null 或字符串
    phone: string|null; // 可能为 null 或字符串
    orgCode: string|null; // 可能为 null 或字符串
    orgCodeTxt: string|null; // 可能为 null 或字符串
    status: number;
    delFlag: number;
    workNo: string|null; // 可能为 null 或字符串
    post: string|null; // 可能为 null 或字符串
    telephone: string;
    izContractor: string;
    createBy: string|null; // 可能为 null 或字符串
    createTime: string; // 日期时间格式字符串
    updateBy: string;
    updateTime: string; // 日期时间格式字符串
    activitiSync: string|null; // 可能为 null 或其他类型
    userIdentity: string|null; // 可能为 null 或字符串
    departIds: string|null; // 可能为 null 或字符串
    relTenantIds: string;
    clientId: string|null; // 可能为 null 或字符串
    homePath: string|null; // 可能为 null 或字符串
    clientType: string;
    schoolId: string;
    izPassword: string;
    organizationId: string;
    organizationName: string;
    wxopenId: string;
    roleId: string|null; // 可能为 null 或字符串
    roleName: string|null; // 可能为 null 或字符串
    loginType: string;
    izCitySportsBureau: string|null; // 可能为 null 或字符串
    unitIds: string;
    gysUserSchoolIds: string|null; // 可能为 null 或字符串
    izManyUnit: string|null; // 可能为 null 或字符串
  }

  interface LoginResult {
    userInfo: UserInfo;
    token: string;
  }

  interface LoginResponse {
    success: boolean;
    message: string;
    code: number;
    result: LoginResult;
    timestamp: number;
  }

  interface Data {
    username: string;
    password: string;
  }

  let url = 'https://api.suoeryun.com/ifood/jeecg-system/sys/login';
  let data: Data = {
    username: username,
    password: password
  };

  try {
    let response = await httpRequest.request(
      url,
      {
        method: http.RequestMethod.POST,
        header: { 'Content-Type': 'application/json' },
        extraData: JSON.stringify(data)
      }
    );

    // 确保请求成功（HTTP 状态码为200）
    if (response.responseCode === 200) {
      const jsonResponse = JSON.parse(response.result as string) as LoginResponse;
      if (jsonResponse.code === 200) {
        return [true,jsonResponse.result.userInfo.clientType];
      }
      return [false,"-1"];

    }else {
      console.log('请求失败，状态码:', response.responseCode);
      return [false,"-1"];

    }
  } catch (error) {
    console.error('请求异常:', error);
    return [false,"-1"];
    //return '0';
  }
}

