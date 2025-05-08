import { router } from '@kit.ArkUI'

@Entry
@Component
struct day21gerenxinxi {
  @StorageLink('userName') name: string = ''
  @StorageLink('userGender') gender: string = '请选择'
  @StorageLink('userEmail') email: string = ''
  @StorageLink('userPhone') phone: string = '13800138000'
  @State showSuccessPopup: boolean = false
  @State showErrorPopup: boolean = false
  @State errorMessage: string = ''
  @State showGenderPicker: boolean = false
  @State tempGender: string = '请选择'

  build() {
    Stack() {
      // 主内容区域
      Column() {
        // 姓名编辑行 - 允许输入任何字符
        Row() {
          Text('姓名')
            .width('25%')
            .fontSize(16)
            .textAlign(TextAlign.Start)
            .fontColor('#333')
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Center)

          TextInput({
            text: this.name,
            placeholder: '请输入姓名'
          })
            .onChange((value: string) => {
              this.name = value // 允许输入任何字符
            })
            .placeholderColor('#999')
            .textAlign(TextAlign.End)
            .width('75%')
            .fontSize(16)
            .fontColor('#333')
            .caretColor('#16a34a')
            .height(40)
            .padding({ right: 5 })
            .borderRadius(4)
            .backgroundColor(Color.White)
            .alignSelf(ItemAlign.Center)

          Image($r('app.media.jd_right'))
            .width(15)
            .height(15)
            .margin({ right: 10 })
            .opacity(0.6)
            .alignSelf(ItemAlign.Center)
        }
        .height(60)
        .padding(10)
        .alignItems(VerticalAlign.Center)
        .border({
          width: { bottom: 1 },
          color: '#f2f2f2'
        })

        // 性别选择行
        Row() {
          Text('性别')
            .width('25%')
            .fontSize(16)
            .textAlign(TextAlign.Start)
            .fontColor('#333')
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Center)

          Text(this.gender)
            .width('75%')
            .textAlign(TextAlign.End)
            .fontSize(16)
            .fontColor(this.gender === '请选择' ? '#999' : '#333')
            .padding({ right: 5 })
            .alignSelf(ItemAlign.Center)

          Image($r('app.media.jd_right'))
            .width(15)
            .height(15)
            .padding({ right: 10 })
            .opacity(0.6)
            .alignSelf(ItemAlign.Center)
        }
        .height(60)
        .padding(10)
        .alignItems(VerticalAlign.Center)
        .border({
          width: { bottom: 1 },
          color: '#f2f2f2'
        })
        .onClick(() => {
          this.tempGender = this.gender === '请选择' ? '男' : this.gender
          this.showGenderPicker = true
        })

        // 邮箱编辑行
        Row() {
          Text('邮箱')
            .width('25%')
            .fontSize(16)
            .textAlign(TextAlign.Start)
            .fontColor('#333')
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Center)

          TextInput({
            placeholder: '请输入邮箱(可选)',
            text: this.email
          })
            .onChange((value: string) => {
              this.email = value
            })
            .placeholderColor('#999')
            .textAlign(TextAlign.End)
            .width('75%')
            .fontSize(16)
            .fontColor('#333')
            .caretColor('#16a34a')
            .height(40)
            .padding({ right: 5 })
            .borderRadius(4)
            .backgroundColor(Color.White)
            .alignSelf(ItemAlign.Center)

          Image($r('app.media.jd_right'))
            .width(15)
            .height(15)
            .margin({ right: 10 })
            .opacity(0.6)
            .alignSelf(ItemAlign.Center)
        }
        .height(60)
        .padding(10)
        .alignItems(VerticalAlign.Center)
        .border({
          width: { bottom: 1 },
          color: '#f2f2f2'
        })

        // 手机号编辑行
        Row() {
          Text('手机号')
            .width('25%')
            .fontSize(16)
            .textAlign(TextAlign.Start)
            .fontColor('#333')
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Center)

          TextInput({
            text: this.phone,
            placeholder: '请输入手机号'
          })
            .onChange((value: string) => {
              if (/^\d*$/.test(value) && value.length <= 11) {
                this.phone = value
              }
            })
            .placeholderColor('#999')
            .textAlign(TextAlign.End)
            .width('75%')
            .fontSize(16)
            .fontColor('#333')
            .caretColor('#16a34a')
            .height(40)
            .padding({ right: 5 })
            .borderRadius(4)
            .backgroundColor(Color.White)
            .alignSelf(ItemAlign.Center)

          Image($r('app.media.jd_right'))
            .width(15)
            .height(15)
            .margin({ right: 10 })
            .opacity(0.6)
            .alignSelf(ItemAlign.Center)
        }
        .height(60)
        .padding(10)
        .alignItems(VerticalAlign.Center)
        .border({
          width: { bottom: 1 },
          color: '#f2f2f2'
        })

        // 确认修改按钮
        Button('确认修改')
          .width('90%')
          .height(50)
          .backgroundColor('#16a34a')
          .fontColor('#fff')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .margin({ top: 30 })
          .borderRadius(25)
          .onClick(() => {
            if (this.validateInputs()) {
              this.saveChanges()
              this.showSuccessPopup = true
              setTimeout(() => {
                this.showSuccessPopup = false
                router.back()
              }, 2000)
            } else {
              this.showErrorPopup = true
              setTimeout(() => {
                this.showErrorPopup = false
              }, 2000)
            }
          })

        // 返回按钮
        Image($r('app.media.557'))
          .onClick(() => {
            router.pushUrl({
              url:'pages/day14wode'
            })
          })
          .width('10%')

          .position({
            x: '85%',
            y: '55%'
          })
          .borderRadius(25)
          .shadow({
            radius: 10,
            color: '#16a34a20',
            offsetX: 0,
            offsetY: 2
          })
      }
      .width('100%')
      .height('100%')
      .padding(10)
      .backgroundColor('#ffffff')

      // 成功提示弹窗
      if (this.showSuccessPopup) {
        Column() {
          Text('修改成功')
            .fontSize(18)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 15 })
        }
        .width(180)
        .height(100)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#16a34a')
        .opacity(0.95)
        .borderRadius(12)
        .position({ x: '50%', y: '50%' })
        .translate({ x: -90, y: -50 })
        .shadow({
          radius: 20,
          color: '#16a34a40',
          offsetX: 0,
          offsetY: 4
        })
      }

      // 错误提示弹窗
      if (this.showErrorPopup) {
        Column() {
          Text(this.errorMessage)
            .fontSize(18)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Medium)
            .margin({ bottom: 15 })
        }
        .width(180)
        .height(100)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#ff4d4f')
        .opacity(0.95)
        .borderRadius(12)
        .position({ x: '50%', y: '50%' })
        .translate({ x: -90, y: -50 })
        .shadow({
          radius: 20,
          color: '#ff4d4f40',
          offsetX: 0,
          offsetY: 4
        })
      }

      // 性别选择面板（居中显示）
      if (this.showGenderPicker) {
        // 半透明背景层
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('#000000')
          .opacity(0.4)
          .onClick(() => {
            this.showGenderPicker = false
          })

        // 居中显示的性别选择面板
        Column() {
          // 顶部操作栏
          Row() {
            Button('取消')
              .fontSize(16)
              .fontColor('#666')
              .backgroundColor(Color.Transparent)
              .onClick(() => {
                this.showGenderPicker = false
              })
              .margin({ left: 20 })

            Blank()
              .layoutWeight(1)

            Button('完成')
              .fontSize(16)
              .fontColor('#16a34a')
              .backgroundColor(Color.Transparent)
              .onClick(() => {
                this.gender = this.tempGender
                this.showGenderPicker = false
              })
              .margin({ right: 20 })
          }
          .width('100%')
          .height(50)
          .justifyContent(FlexAlign.SpaceBetween)
          .border({
            width: { bottom: 1 },
            color: '#f2f2f2'
          })

          // 性别选项
          Column() {
            // 男选项
            Row() {
              Text('男')
                .fontSize(16)
                .fontColor('#333')
                .margin({ left: 20 })

              Blank()
            }
            .width('100%')
            .height(60)
            .backgroundColor(this.tempGender === '男' ? '#f5f5f5' : Color.White)
            .onClick(() => {
              this.tempGender = '男'
            })

            Divider()
              .strokeWidth(1)
              .color('#f2f2f2')

            // 女选项
            Row() {
              Text('女')
                .fontSize(16)
                .fontColor('#333')
                .margin({ left: 20 })

              Blank()
            }
            .width('100%')
            .height(60)
            .backgroundColor(this.tempGender === '女' ? '#f5f5f5' : Color.White)
            .onClick(() => {
              this.tempGender = '女'
            })
          }
          .width('100%')
        }
        .width('80%')
        .height(180)
        .backgroundColor(Color.White)
        .borderRadius(12)
        .position({ x: '50%', y: '50%' })
        .translate({ x: -144, y: -90 })
        .shadow({
          radius: 20,
          color: '#00000020',
          offsetX: 0,
          offsetY: 4
        })
      }
    }
    .width('100%')
    .height('100%')
  }

  validateInputs(): boolean {
    // 验证姓名不能为空（允许任何字符）
    if (!this.name.trim()) {
      this.errorMessage = '请输入姓名'
      return false
    }

    // 验证性别已选择
    if (this.gender === '请选择') {
      this.errorMessage = '请选择性别'
      return false
    }

    // 验证手机号格式
    if (!/^1[3-9]\d{9}$/.test(this.phone)) {
      this.errorMessage = '请输入正确的手机号码'
      return false
    }

    // 验证邮箱格式（可选）
    if (this.email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.email)) {
      this.errorMessage = '请输入正确的邮箱格式'
      return false
    }

    return true
  }

  saveChanges() {
    // 保存所有信息到AppStorage
    AppStorage.SetOrCreate('userName', this.name)
    AppStorage.SetOrCreate('userGender', this.gender)
    AppStorage.SetOrCreate('userEmail', this.email)
    AppStorage.SetOrCreate('userPhone', this.phone)

    console.log('用户信息已保存:', {
      name: this.name,
      gender: this.gender,
      email: this.email,
      phone: this.phone
    })
  }
}