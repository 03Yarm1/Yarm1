import { router } from '@kit.ArkUI'

@Entry
@Component
struct Page55P {

  @State name: string = '田老师'
  @State gender: string = '请选择'
  build() {
    Column() {

      Row() {
        Text('姓名')
          .width('20%')
          .textAlign(TextAlign.Start)
        Text(this.name)
          .width('80%')
          .textAlign(TextAlign.End)
          .fontColor('#999')
        Image($r('app.media.jd_right'))
          .width(15)
          .height(15)
          .margin({ right: 10 })
      }
      .padding(10)

      Row() {
        Text('性别')
          .width('20%')
          .textAlign(TextAlign.Start)
        Text(this.gender)
          .width('80%')
          .textAlign(TextAlign.End)
          .fontColor('#999')
        Image($r('app.media.jd_right'))
          .width(15)
          .height(15)
          .margin({ right: 10 })
      }
      .border({
        width:{top:2,bottom:1},
        color:'#f2f2f2'
      })
      .onClick(() => this.showGenderOptions())
      .padding(10)

      Row() {
        Text('邮箱')
          .width('20%')
          .textAlign(TextAlign.Start)
        TextInput({
          placeholder: '请输入邮箱',
        })
          .backgroundColor(Color.White)
          .width('80%')
          .textAlign(TextAlign.End)
        Image($r('app.media.jd_right'))
          .width(15)
          .height(15)
          .margin({ right: 10 })
      }
      .border({
        width:{bottom:1},
        color:'#f2f2f2'
      })
      .padding(10)

      Row() {
        Text('手机号')
          .width('20%')
          .textAlign(TextAlign.Start)
        TextInput({
          placeholder: '请输入手机号',
        })
          .backgroundColor(Color.White)
          .width('80%')
          .textAlign(TextAlign.End)
        Image($r('app.media.jd_right'))
          .width(15)
          .height(15)
          .margin({ right: 10 })
      }
      .padding(10)

      Button('确认修改')
        .width('100%')
        .height(40)
        .backgroundColor('#16a34a')
        .fontColor('#fff')
        .margin({ top: 10 })
        .onClick(()=>{

        })


      Image($r('app.media.557'))
        .onClick(()=>{
          router.pushUrl({
            url:'pages/wode'
          })
        })
        .width('10%')
        .position({
          x:300,y:350
        })
        .borderRadius(100)

    }

    .width('100%')
    .padding(10)
  }

  showGenderOptions() {
    let options = ['请选择', '男', '女'];
    let selectedGender = this.gender;
    let selectedIndex = options.indexOf(selectedGender);

    // 弹出菜单逻辑，这里简化为直接选择下一个选项
    selectedIndex = (selectedIndex + 1) % options.length;
    this.gender = options[selectedIndex];
  }
}