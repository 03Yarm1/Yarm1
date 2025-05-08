import { router } from '@kit.ArkUI'
@Entry
@Component
struct day14wode {

  @StorageLink('userName') name: string = '田老师'
  @StorageLink('userPhone') phone: string = '13800138000'

  build() {
    Column(){
      Row(){
        Column(){
          Image($r('app.media.avatar_boy'))
            .width(50)
            .height(50)
            .borderRadius(100)
            .margin({left:20,right:10})
        }
        Column({space:5}){
          Text(this.name)
          Text(this.phone)
        }

      }
      Column(){
        Row(){
          Text('修改个人信息')

          Image($r('app.media.jd_right'))

            .onClick(()=>{
              router.pushUrl({
                url: 'pages/day21gerenxinxi'
              })
            })
            .width(20)
            .position({x:300})
        }
        .margin({left:-40})
        .onClick(()=>{
          router.pushUrl({
            url: 'pages/day21gerenxinxi'
          })
        })
        Text('修改密码')
          .position({x:-40,y:40})
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/day22xiugaimima'
            })
          })
        Image($r('app.media.jd_right'))
          .width(20)
          .position({x:260,y:40})
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/day22xiugaimima'
            })
          })

        Text('退出登录')
          .position({x:-40,y:80})
          .onClick(()=>{
            router.pushUrl({
              url:'pages/day12'
            })
          })
        Image($r('app.media.jd_right'))
          .width(20)
          .position({x:260,y:80})

          .onClick(()=>{
            router.pushUrl({
              url:'pages/day12'
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
          router.pushUrl({ url: 'pages/day13index' })
        })
        .margin({left:57,right:150})
        Column() {
          Image($r('app.media.552'))
            .margin({top:5})
            .width(30)
          Text('我的')
            .margin({top:5})
            .fontColor('#30b596')
        }
        .onClick(() => {
          router.pushUrl({ url: 'pages/day14wode' })
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
