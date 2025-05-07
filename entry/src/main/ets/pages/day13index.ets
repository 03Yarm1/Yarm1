import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State color:string='#aeaeae'
  @State message: string = '今天';

  build() {
    Column(){
      Scroll(){
        Column(){
          Swiper(){
            Image($r('app.media.banner1'))
            Image($r('app.media.banner2'))
            Image($r('app.media.banner3'))
          }
          .interval(4500)
          .autoPlay(true)
          .borderRadius(15)
          .width('95%')
          .indicator(
            Indicator.dot()
              .selectedColor(Color.White)
          )

          Row(){
            Text('公告')
              .margin({top:0})
              .padding(5)
              .backgroundColor('#ffb172')
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
              .fontStyle(FontStyle.Italic)
          }
          .margin({top:20})
          .backgroundColor('#f8f9fd')
          .width('95%')
          .height(40)

          Column(){
            Row(){
              Text('今日 ')
                .fontColor('#16b76a')
                .padding({top:7,bottom:7,left:13})
                .width(60)
                .borderRadius(10)
                .margin({top:10,left:10})
                .backgroundColor('#f0f0f0')
                .onClick(()=>{
                  this.message='今天'
                })
              Text('本周 ')
                .fontColor('#16b76a')
                .padding({top:7,bottom:7,left:13})
                .width(60)
                .borderRadius(10)
                .margin({top:10,left:10})
                .backgroundColor('#f0f0f0')
                .onClick(()=>{
                  this.message='本周'
                })
              Text('本月 ')
                .fontColor('#16b76a')
                .padding({top:7,bottom:7,left:13})
                .width(60)
                .borderRadius(10)
                .margin({top:10,left:10})
                .backgroundColor('#f0f0f0')
                .onClick(()=>{
                  this.message='本月'
                })
              Text('本年 ')
                .fontColor('#16b76a')
                .padding({top:7,bottom:7,left:13})
                .width(60)
                .borderRadius(10)
                .margin({top:10,left:10})
                .backgroundColor('#f0f0f0')
                .onClick(()=>{
                  this.message='本年'
                })
            }
            .alignSelf(ItemAlign.Start)

            Row(){

            }
            .margin({top:5,bottom:10})
            .width('95%')
            .height(2)
            .backgroundColor('#f0f0f0')

            Row(){
              Text(`${this.message}本校当前总合评分`)
                .margin({left:10})
              Text('高风险')
                .margin({left:110})
                .fontColor('#ff0000')
            }
            .alignSelf(ItemAlign.Start)

            Row(){
              Text('0')
                .fontColor('#ff0000')
                .fontSize(40)
              Text('分')
                .padding({bottom:5})
                .margin({right:130})
              Text('超过本地')
                .padding({bottom:5})
              Text('100%')
                .fontColor('#ff0000')
                .padding({bottom:5})
              Text('的学校')
                .padding({bottom:5})
            }
            .justifyContent(FlexAlign.Start)
            .alignItems(VerticalAlign.Bottom)
          }
          .margin({top:10})
          .width('95%')
          .backgroundColor('#f8f9fd')

          Text('需求计划')
            .fontWeight(FontWeight.Bold)
            .margin({top:10,bottom:10})
          Row(){
            Column() {
              Image($r('app.media.home1'))
                .width(30)
              Text('上报计划')
                .margin({top:10,bottom:10})
            }
            .margin({right:10})
            .backgroundColor('#f8f9fd')
            Column() {
              Image($r('app.media.home2'))
                .width(30)
              Text('需求审批')
                .margin({top:10,bottom:10})
            }
            .margin({right:10})
            .backgroundColor('#f8f9fd')
          }

          Text('出入库')
            .fontWeight(FontWeight.Bold)
            .margin({top:10,bottom:10})
          Row(){
            Column() {
              Image($r('app.media.home5'))
                .width(30)
              Text('采购入库')
                .margin({top:10,bottom:10})
            }
            .margin({right:10})
            .backgroundColor('#f8f9fd')
            Column() {
              Image($r('app.media.home6'))
                .width(30)
              Text('供应出库')
                .margin({top:10,bottom:10})
            }
            .margin({right:10})
            .backgroundColor('#f8f9fd')
            Column() {
              Image($r('app.media.home12'))
                .width(30)
              Text('实时库存')
                .margin({top:10,bottom:10})
            }
            .margin({right:10})
            .backgroundColor('#f8f9fd')
          }
        }
        .alignItems(HorizontalAlign.Start)
      }

      Stack(){
        Row(){
          Column() {
            Image($r('app.media.1'))
              .width(30)
              .fillColor('#30b596')
            Text('首页')
              .fontColor('#30b596')
          }

          .margin({left:57,right:150})
          Column() {
            Image($r('app.media.about'))
              .width(30)
            Text('我的')
          }
          .onClick(() => {
            if (this.color=='#aeaeae') {
              this.color='#30b596'
            }
            router.pushUrl({ url: 'pages/day14wode' })
          })
        }
        .borderWidth({top:3})
        .borderColor({top:'#eeeeee'})
        .width('95%')
      }
      .margin({top:100})
    }
    .width('100%')
    .height('100%')
  }
}