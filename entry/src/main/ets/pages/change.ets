import { router } from '@kit.ArkUI'

@Entry
@Component
struct Page55change {
  build() {
    Column(){
      Stack(){
        Text(' ')
          .width('100%')
          .height('100%')

          .backgroundColor('#f1f1f1')

        Column(){
          TextInput({
            placeholder:'请输入旧密码'
          })
            .backgroundColor(Color.White)
            .borderRadius(1)

          TextInput({
            placeholder:'请输入新密码'
          })
            .borderRadius(1)
            .backgroundColor(Color.White)
            .border({
              width:{top:2,bottom:1},
              color:'#f2f2f2'
            })
          TextInput({
            placeholder:'请再次输入新密码'
          })
            .borderRadius(1)
            .backgroundColor(Color.White)
          Button('确认修改')
            .width('100%')
            .margin({top:20})
            .backgroundColor('#16b76a')
        }
        .width(340)
        .margin({left:10})
        .position({y:30})
      }
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
  }
}
