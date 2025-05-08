import { router } from '@kit.ArkUI'
@Entry
@Component
struct Page55 {

  build() {
    Column(){
      Row(){
        Column(){
          Image($r('app.media.jd_QQ'))
            .width(50)
            .height(50)
            .borderRadius(100)
            .margin({left:20})
        }
        Column(){
          Text('学校')
          Text('sd')
        }
        .margin({left:20})
      }
      Column(){
        Row(){
          Text('修改个人信息')
          Image($r('app.media.jd_right'))

            .onClick(()=>{
              router.pushUrl({
                url: 'pages/changpeople'
              })
            })
            .width(20)
            .position({x:300})
        }
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/changpeople'
          })
        })
        Text('修改密码')
          .position({y:40})
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/change'
            })
          })
        Image($r('app.media.jd_right'))
          .width(20)
          .position({x:300,y:40})
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/change'
            })
          })

        Text('退出登录')
          .position({y:80})
          .onClick(()=>{
            router.pushUrl({
              url:'pages/login'
            })
          })
        Image($r('app.media.jd_right'))
          .width(20)
          .position({x:300,y:80})

          .onClick(()=>{
            router.pushUrl({
              url:'pages/login'
            })
          })

      }
      .margin({top:30})



      Row(){
        Column() {
          Image($r('app.media.1'))
            .width(30)
            .fillColor('#ababab')
          Text('首页')
        }
        .onClick(()=>{
          router.pushUrl({ url: 'pages/Page' })
        })
        .margin({left:57,right:150})
        Column() {
          Image($r('app.media.522'))
            .margin({top:5})
            .width(30)
          Text('我的')
            .margin({top:5})
            .fontColor('#30b596')
        }
        .onClick(() => {
          router.pushUrl({ url: 'pages/Page55' })
        })
      }
      .borderWidth({top:3})
      .borderColor({top:'#eeeeee'})
      .width('95%')
      .position({
        y:670
      })
    }


  }


}
