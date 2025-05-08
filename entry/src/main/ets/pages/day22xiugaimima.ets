import { router } from '@kit.ArkUI'

@Entry
@Component
struct day22xiugaimima {
  @State oldPassword: string = ''
  @State newPassword: string = ''
  @State confirmPassword: string = ''
  @State showSuccessPopup: boolean = false
  @State showErrorPopup: boolean = false
  @State errorMessage: string = ''

  build() {
    Stack() {
      Column() {
        Stack() {
          Text(' ')
            .width('100%')
            .height('100%')
            .backgroundColor('#f1f1f1')

          Column() {
            // 旧密码输入
            TextInput({
              placeholder: '请输入旧密码',
              text: this.oldPassword
            })
              .type(InputType.Password)
              .backgroundColor(Color.White)
              .borderRadius(1)
              .onChange((value: string) => {
                this.oldPassword = value
              })

            // 新密码输入
            TextInput({
              placeholder: '请输入新密码',
              text: this.newPassword
            })
              .type(InputType.Password)
              .borderRadius(1)
              .backgroundColor(Color.White)
              .border({
                width: { top: 2, bottom: 1 },
                color: '#f2f2f2'
              })
              .onChange((value: string) => {
                this.newPassword = value
              })

            // 确认新密码
            TextInput({
              placeholder: '请再次输入新密码',
              text: this.confirmPassword
            })
              .type(InputType.Password)
              .borderRadius(1)
              .backgroundColor(Color.White)
              .onChange((value: string) => {
                this.confirmPassword = value
              })

            // 确认修改按钮
            Button('确认修改')
              .width('100%')
              .margin({ top: 20 })
              .backgroundColor('#16b76a')
              .onClick(() => {
                if (this.validatePasswords()) {
                  this.showSuccessPopup = true
                  setTimeout(() => {
                    this.showSuccessPopup = false
                    // 这里可以添加实际的密码修改逻辑
                  }, 2000)
                }
              })
          }
          .width(340)
          .margin({ left: 10 })
          .position({ y: 30 })
        }

        // 返回按钮
        Image($r('app.media.557'))
          .onClick(() => {
            router.pushUrl({
              url: 'pages/day14wode'
            })
          })
          .width('10%')
          .position({
            x: 300, y: 350
          })
          .borderRadius(100)

        // 成功提示弹窗
        if (this.showSuccessPopup) {
          Column() {
            Text('密码修改成功')
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
      }
    }
    .width('100%')
    .height('100%')
  }

  // 密码验证逻辑
  validatePasswords(): boolean {
    // 检查旧密码是否为空
    if (!this.oldPassword.trim()) {
      this.errorMessage = '请输入旧密码'
      this.showErrorPopup = true
      setTimeout(() => this.showErrorPopup = false, 2000)
      return false
    }

    // 检查新密码是否为空
    if (!this.newPassword.trim()) {
      this.errorMessage = '请输入新密码'
      this.showErrorPopup = true
      setTimeout(() => this.showErrorPopup = false, 2000)
      return false
    }

    // 检查新密码长度（示例：至少6位）
    if (this.newPassword.length < 6) {
      this.errorMessage = '密码至少需要6位'
      this.showErrorPopup = true
      setTimeout(() => this.showErrorPopup = false, 2000)
      return false
    }

    // 检查两次输入的新密码是否一致
    if (this.newPassword !== this.confirmPassword) {
      this.errorMessage = '两次输入的密码不一致'
      this.showErrorPopup = true
      setTimeout(() => this.showErrorPopup = false, 2000)
      return false
    }

    // 检查新密码和旧密码是否相同
    if (this.oldPassword === this.newPassword) {
      this.errorMessage = '新密码不能与旧密码相同'
      this.showErrorPopup = true
      setTimeout(() => this.showErrorPopup = false, 2000)
      return false
    }

    return true
  }
}