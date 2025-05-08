@Entry
@Component
struct Report {
  @State selectedCount: number = 0
  @State totalAmount: number = 0

  build() {
    Column() {

      // 需求单位
      Row() {
        Image($r('app.media.iunitName'))
          .width(20)
          .height(20)
          .margin({ right: 8 })

        Text('需求单位')
          .fontSize(15)
          .fontColor('#333333')

        Text('*')
          .fontColor('#FF0000')
          .margin({ left: 4 })

        Text('请选择')
          .fontColor('#999999')
          .margin({ left: 100 })

        Image($r('app.media.jd_right'))
          .width(16)
          .height(16)
          .margin({ left: 10 })
      }
      .padding(16)
      .backgroundColor(Color.White)

      // 供应日期
      Row() {
        Image($r('app.media.isupplyDate'))
          .width(20)
          .height(20)
          .margin({ right: 8 })

        Text('供应日期')
          .fontSize(15)
          .fontColor('#333333')

        Text('*')
          .fontColor('#FF0000')
          .margin({ left: 4 })

        Text('请选择')
          .fontColor('#999999')
          .margin({ left: 100 })

        Image($r('app.media.jd_right'))
          .width(16)
          .height(16)
          .margin({ left: 10 })
      }
      .padding(16)
      .backgroundColor(Color.White)

      // 供应时间
      Row() {
        Image($r('app.media.isupplyTime'))
          .width(20)
          .height(20)
          .margin({ right: 8 })

        Text('供应时间')
          .fontSize(15)
          .fontColor('#333333')

        Text('*')
          .fontColor('#FF0000')
          .margin({ left: 4 })

        Text('请选择')
          .fontColor('#999999')
          .margin({ left: 100 })

        Image($r('app.media.jd_right'))
          .width(16)
          .height(16)
          .margin({ left: 10 })
      }
      .padding(16)
      .backgroundColor(Color.White)

      // 需求类型
      Row() {
        Image($r('app.media.idemand'))
          .width(20)
          .height(20)
          .margin({ right: 8 })

        Text('需求类型')
          .fontSize(15)
          .fontColor('#333333')

        Text('*')
          .fontColor('#FF0000')
          .margin({ left: 4 })

        Text('请选择')
          .fontColor('#999999')
          .margin({ left: 100 })

        Image($r('app.media.jd_right'))
          .width(16)
          .height(16)
          .margin({ left: 10 })
      }
      .padding(16)
      .backgroundColor(Color.White)

      // 餐别
      Row() {
        Image($r('app.media.imealCategory'))
          .width(20)
          .height(20)
          .margin({ right: 8 })

        Text('餐        别')
          .fontSize(15)
          .fontColor('#333333')

        Text('*')
          .fontColor('#FF0000')
          .margin({ left: 4 })

        Text('请选择')
          .fontColor('#999999')
          .margin({ left: 100 })

        Image($r('app.media.jd_right'))
          .width(16)
          .height(16)
          .margin({ left: 10 })
      }
      .padding(16)
      .backgroundColor(Color.White)
      Row() {
        Image($r('app.media.iremarks'))
          .width(20)
          .height(20)
          .margin({ right: 8 })

        Text('摘        要')
          .fontSize(15)
          .fontColor('#333333')

        Text('*')
          .fontColor('#FF0000')
          .margin({ left: 4 })

        Text('请输入摘要内容')
          .fontColor('#999999')
          .margin({ left: 100 })

        Image($r('app.media.jd_right'))
          .width(16)
          .height(16)
          .margin({ left: 10 })
      }
      .padding(16)
      .backgroundColor(Color.White)
      // 添加食材按钮
      Button('+添加食材', { type: ButtonType.Normal })
        .width('90%')
        .height(40)
        .backgroundColor('#4CAF50')
        .fontColor(Color.White)
        .margin({ top: 20 })

      // 已选计数
      Text(`已选中${this.selectedCount}种食材`)
        .fontSize(14)
        .fontColor('#999999')
        .margin({ top: 8 })


      // 总计金额
      Row() {
        Text('总计：')
          .fontSize(18)
          .fontColor('#333333')
        Text(`${this.totalAmount}元`)
          .fontSize(18)
          .fontColor('#FF5722')
      }
      .width('90%')
      .margin({ top: 20 })

      // 底部按钮
      Row({ space: 20 }) {
        Button('保存', { type: ButtonType.Normal })
          .width(160)
          .height(45)
          .backgroundColor('#E0E0E0')
          .fontColor('#333333')

        Button('保存上报', { type: ButtonType.Normal })
          .width(160)
          .height(45)
          .backgroundColor('#E0E0E0')
          .fontColor('#333333')
      }
      .width('100%')
      .margin({ top: 30, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F8F8F8')
  }
}